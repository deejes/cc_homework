Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
resources :posts do
  resources :comments
end
resource :session
resources :users



root 'welcome#index'
end
# http://guides.rubyonrails.org/routing.html
