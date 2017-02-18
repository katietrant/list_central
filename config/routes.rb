Rails.application.routes.draw do
  root to: 'users#index'

  resources :users, only: [:new, :create, :show]
  resources :records, except: [:new, :show, :edit]
  resources :lists, except: [:index] do
    resources :items, except: [:index, :show]
  end

  resources :tags
  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  get '/logout' => 'sessions#destroy'
end
