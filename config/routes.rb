Rails.application.routes.draw do
  resources :requests do
    get 'request', to:'request#show'
  end
  # resources :users, except: :index do
  #   get 'landingPage', to:'landingPage#show'
  #   resources :pools do
  #     resources :requests do
  #       get 'request', to:'request#show'
  #     end
  #   end
  #   resources :admin do
  #   end
  # end
end
