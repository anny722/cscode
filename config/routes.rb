Rails.application.routes.draw do
  devise_for :users
  root to: 'categories#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :categories, only: [:create, :show, :destroy] do
    resources :themes, only: [:create]
  end
  resources :themes, only: [:show, :destroy] do
    resources :questions, only: [:create]
  end
  resources :questions, only: [:show, :destroy] do
    resources :tabs, only: [:create]
    resources :comments, only: [:create]
    resources :solutions, only: [:create]
    resources :outputs, only: [:create]
    resources :links, only: [:create]
  end
  resources :comments, only: [:destroy]
  resources :solutions, only: [:destroy]
  resources :outputs, only: [:destroy]
  resources :tabs, only: [:destroy]
end
