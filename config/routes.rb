Rails.application.routes.draw do
  root to: 'records#index'

  resources :records

end
