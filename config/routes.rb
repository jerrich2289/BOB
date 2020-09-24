Rails.application.routes.draw do
  get 'items/new'
  get 'items/create'
  get 'items/index'
  devise_for :users
  root to: 'pages#landing'

  get 'items/dummy'
  get 'trades/new'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
