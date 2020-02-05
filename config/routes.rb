Rails.application.routes.draw do
  devise_for :users
  root to: 'conditions#welcome'
  resources :conditions, only: [:index, :new, :create, :edit, :update, :destroy] do
    collection do
      get :welcome
    end
  end
  resources :offices, only: [:index] do
    collection { post :import }
  end
  resources :users, only: [:index, :show]
end
