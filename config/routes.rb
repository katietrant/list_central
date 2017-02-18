Rails.application.routes.draw do
  root to: 'sessions#new'

  resources :users, only: [:new, :create, :show] do
    resources :records, except: [:new, :show, :edit]
  end
  resources :lists, except: [:index] do
    resources :items, except: [:index, :show]
  end

  resources :tags
  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  get '/logout' => 'sessions#destroy'
end
