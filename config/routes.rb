Rails.application.routes.draw do
  root to: 'offices#index'
  resources :offices, only: [:index] do
    collection { post :import }
  end
end
