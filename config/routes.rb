Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :orders do
    resources :origin, only: [:index, :show]
    resources :destination, only: [:index, :show]
  end
  resources :origins, only: [:index, :show]
  resources :destinations, only: [:index, :show]

end
