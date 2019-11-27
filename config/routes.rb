Rails.application.routes.draw do
  get 'users/show'
  devise_for :users
  root to: 'pages#home'

  resources :users, only: [:show]

  resources :restaurants, only: [:show] do
    resources :dishes, only: [:index]
  end

  resources :dishes, only: [:show] do
    resources :votes, only: [:create]
  end

  resources :reviews, only: [:show] do
    resources :vote_reviews, only: [:create]
  end
end
