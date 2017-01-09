Rails.application.routes.draw do
  root to: 'users#index'

  resources :records
  resources :users do
    resources :lists
  end

  resources :tags
  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  get '/logout' => 'sessions#destroy'
end
