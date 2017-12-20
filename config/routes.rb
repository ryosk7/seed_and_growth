Rails.application.routes.draw do
  get 'likes/create'

  get 'likes/destroy'

  mount Ckeditor::Engine => '/ckeditor'
  # コールバック用URL
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }

  resources :posts do
    resources :comments
    resources :likes, only: [:create, :destroy]
  end
  resources :users do
    member do
      get :following, :followers
    end
  end
  resources :relationships,  only: [:create, :destroy]

  root 'home#index'
end
