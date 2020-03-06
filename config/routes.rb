Rails.application.routes.draw do
  devise_for :users
  root to: 'contents#index'

  resources :contents, only: [:index]
  resources :conditions, only: [:create, :edit, :update, :destroy]
  resources :users, only: [:index, :show]
  resources :offices, only: [:index, :show] do
    collection { post :import }
  end

end