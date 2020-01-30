Rails.application.routes.draw do
  root to: 'offices#index'
  resources :offices, only: [:index]
end
