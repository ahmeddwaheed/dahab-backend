Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html


  resources :notifications
  resources :pools

  
  resources :charges


  resources :requests do
    patch 'accept', to: 'requests#accept'
    patch 'reject', to: 'requests#reject'

    collection do
      get 'find_user', to: "requests#find_user"
      get 'find_pool', to: "requests#find_pool"
    end
  end

  resources :users_pools

  mount ActionCable.server => '/cable'


  resources :users do
    collection do
      post 'login', to: 'sessions#create'
      post 'register', to: 'registrations#create'
    end
  end

  get '/current_user', to: 'users#currentUser'

  get '/current_admin', to: 'admins#currentAdmin'



  resources :admins do
    collection do
      post 'login', to: 'admin_session#create'
    end
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

end
