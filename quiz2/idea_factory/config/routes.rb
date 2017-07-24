Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :ideas do
    resources :reviews
  end
  resources :users
  resource :session

  get('/', to: 'ideas#index')


end
