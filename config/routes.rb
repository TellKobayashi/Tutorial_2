Rails.application.routes.draw do
  resources :marimos
  resources :users
  root 'application#hello'
end
