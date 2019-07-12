Rails.application.routes.draw do
  devise_for :users
  root to: 'categories#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :categories, only: [:create, :show] do
    resources :themes, only: [:create]
  end
  resources :themes, only: [:show] do
    resources :questions, only: [:create]
  end
  resources :questions, only: [:show] do
    resources :tabs, only: [:create]
    resources :comments, only: [:create]
    resources :solutions, only: [:create]
    resources :outputs, only: [:create]
    resources :links, only: [:create]
  end
end
