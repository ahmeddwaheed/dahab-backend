Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html


  resources :notifications
  resources :pools
  resources :requests do
    collection do
      get 'find_user', to: "requests#find_user"
      get 'find_pool', to: "requests#find_pool"
    end
  end
  resources :users
end
