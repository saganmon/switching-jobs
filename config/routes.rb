Rails.application.routes.draw do
  root to: 'offices#index'
  resources :conditions, only: [:index, :create]
  resources :offices, only: [:index] do
    collection { post :import }
  end
end
