Rails.application.routes.draw do
  devise_for :members
  resources :customers
  root 'customers#index'
end
