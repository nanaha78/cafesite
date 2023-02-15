Rails.application.routes.draw do
  devise_for :users
  resources :users, only: [:show] # ユーザーマイページへのルーティング
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :dogs do
    resources :likes, only: [:create, :destroy]
    resources :comments, only: [:create]
  end
  root 'dogs#index'
  resources :tags do
    get 'dogs', to: 'dogs#search'
  end
end
