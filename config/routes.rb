Rails.application.routes.draw do
  root to: 'users#index'

  resources :users
  resources :records
  resources :lists do
    resources :items
  end

  resources :tags
  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  get '/logout' => 'sessions#destroy'
end
