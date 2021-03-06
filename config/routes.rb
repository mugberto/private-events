Rails.application.routes.draw do
  get 'user_sessions/new', to: 'user_sessions#new', as: 'log_in'
  get 'user_sessions/create', to: 'user_sessions#create'
  get 'user_sessions/destroy', to: 'user_sessions#destroy'
  root to: 'events#index'
  resources :users, only: [:new, :create, :show]
  resources :user_sessions, only: [:new, :create, :destroy]
  resources :events, only: [:index, :show, :new, :create]
  resources :attendances, only: [:new, :create]
end
