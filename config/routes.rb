Rails.application.routes.draw do
  
  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }

  resources :teams, except: [:show] do
    member do
      post :select # set user's current team

      get :list_members, path: 'members'
      post :update_members, path: 'members'
    end
  end

  root 'events#index'  
  resources :events do
    get 'go', on: :member
  end
  
end
