Rails.application.routes.draw do
  
  resources :pools 
  resources :requests do
    collection do
      get 'find_user', to: "requests#find_user"
      get 'find_pool', to: "requests#find_pool"      
    end
  end
  resources :users, only: :create do ### LEEEEEH?
    collection do
      post 'confirm'
      post 'login'
    end
  end
  resources :admins
  # resources :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

end
