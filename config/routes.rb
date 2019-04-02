Rails.application.routes.draw do
  devise_for :users, controllers: {
    omniauth_callbacks: "omniauth_callbacks",
  }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :items,only: [:new, :create, :show, :index, :destroy] do
    resources :likes, only: [:create]
    resources :comments, only: [:create]
  end
  root 'items#index'
  get 'users/new'
  post 'users/create'
  get 'top', to: 'items#top'
  get 'mypage', to: 'users#mypage'
  get 'profile', to: 'users#profile'
  get 'userconfirm', to: 'users#userconfirm'
  get 'userlogout', to: 'users#userlogout'
  get 'credit', to: 'users#credit'
  get 'creditregistration', to: 'users#creditregistration'
  get 'itemconfirm', to: 'users#itemconfirm'
  get 'sign_up', to: 'users#sign_up'
  get 'itemsell', to: 'users#itemsell'
  get 'items/search', to: 'items#search'

  resources :credit_card, only:[:index, :new, :create, :destroy]

  resources :categories, only: [:index, :show]
  resources :brands, only: [:index, :show]

end
