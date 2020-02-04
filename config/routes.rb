Rails.application.routes.draw do
  devise_for :users
  root to: 'conditions#index'
  resources :conditions, only: [:index, :new, :create, :show, :edit, :update, :destroy]
  resources :offices, only: [:index] do
    collection { post :import }
  end
  resources :users, only: :show
end
