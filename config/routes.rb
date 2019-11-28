Rails.application.routes.draw do
  get 'users/show'
  devise_for :users
  root to: 'pages#home'

  resources :users, only: [:show]

  resources :restaurants, only: [:show]
  resources :dishes, only: [:index]


  resources :dishes, only: [:show] do
    resources :votes, only: [:create]
    resources :favorites, only: [:create, :destroy]
  end

  resources :reviews, only: [:show] do
    resources :vote_reviews, only: [:create]
  end


end
