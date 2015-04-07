Rails.application.routes.draw do
  devise_for :users, only: []

  namespace :v1, defaults: { format: :json } do
    resources :login, only: [:create], controller: :sessions
    resources :users, only: [:create]
    resources :stories, only: [:index, :show, :create]
  end
end
