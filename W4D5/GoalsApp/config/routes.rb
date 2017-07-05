Rails.application.routes.draw do
  resources :users, only: [:new, :create, :show]
  resources :goals
  resource :session, only: [:new, :create, :destroy]

  root to: 'goals#index'
end
