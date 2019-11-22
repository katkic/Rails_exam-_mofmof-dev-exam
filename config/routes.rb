Rails.application.routes.draw do
  root to: 'apartments#index'
  resources :apartments
end
