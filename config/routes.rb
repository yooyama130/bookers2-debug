Rails.application.routes.draw do
  get 'home/about' => 'homes#about'
  get 'searches/search' => 'searches#search', as: 'search'
  devise_for :users
  root to: 'homes#top'
  resources :users,only: [:show,:index,:edit,:update] do
    get "search", to: "users#search"
    resource :relationships, only: [:create, :destroy]
    get 'followings' => 'users#followings', as: 'followings'
    get 'followers' => 'users#followers', as: 'followers'
  end
  resources :books do
    resources :book_comments, only: [:create, :destroy]
    resource :favorites, only: [:create, :destroy]
  end
end