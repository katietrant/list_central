Rails.application.routes.draw do
  root to: 'users#index'

  resources :users, only: [:new, :create, :show]
  resources :records
  resources :lists do
    resources :items
  end

  resources :tags
  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  get '/logout' => 'sessions#destroy'
end
