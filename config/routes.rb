Rails.application.routes.draw do
  get 'items/dummy'
  resources :items, only: [:new, :create, :index, :show]
  devise_for :users
  root to: 'pages#landing'

  get 'trades/new'
  get '/user' => "items#index", :as => :user_root
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
