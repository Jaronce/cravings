Rails.application.routes.draw do
  get 'users/show'
  devise_for :users
  root to: 'pages#home'

  resources :users, only: [:show]

  resources :restaurants, only: [:show] do
    resources :dishes, only: [:index ,:show] do
      resources :review, only: [:new, :create]
      resources :vote, only: [:create]
    end
  end
end
