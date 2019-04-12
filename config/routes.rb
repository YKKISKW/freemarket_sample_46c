Rails.application.routes.draw do
  devise_for :users, controllers: {
    omniauth_callbacks: "omniauth_callbacks",
  }
  resources :categories, only: [:index, :show]
  resources :middle_categories, only: [:index, :show]
  resources :lower_categories, only: [:index, :show]
  resources :brands, only: [:index, :show]
  resources :credit_card, only:[:index, :new, :create, :destroy]

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :items do
    get :search, on: :collection
    resources :likes, only: [:create]
    resources :comments, only: [:create]
    resources :orders, only:[:new, :create] do
      resources :credit_card, only:[:index, :new, :create]
    end
  end
  resources :users,only: [:show,:new,:create] do
    collection do
      get :profile
      get :userconfirm
      get :userlogout
      get :sign_up
    end
  end
  root 'items#index'
end
