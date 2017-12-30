Rails.application.routes.draw do
  
  resources :pools 
  resources :requests do
    collection do
      get 'find_user', to: "requests#find_user"
      get 'find_pool', to: "requests#find_pool"      
    end
  end
  resources :users do
    collection do
      post 'confirm'
    end
  end
  # resources :users
end
