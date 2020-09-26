Rails.application.routes.draw do
  resources :items, only: [:new, :create, :index]
  devise_for :users
  root to: 'pages#landing'

  get 'items/dummy'

  resources 'trades', only: [:new, :create]

  get '/user' => "items#index", :as => :user_root

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
