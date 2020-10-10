Rails.application.routes.draw do
  root 'homes#top'
  get 'home/about' => 'homes#about'
  get '/search', to: 'searches#search'
  devise_for :users

  resources :relationships, only: [:create, :destroy]

  resources :books do
    resource :favorites, only: [:create, :destroy]
    resources :book_comments, only: [:create, :destroy]
  end

  resources :users, only: [:show,:index,:edit,:update] do
    member do
     get :following, :followers
    end
  end

end