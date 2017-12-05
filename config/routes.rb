Rails.application.routes.draw do
  mount Ckeditor::Engine => '/ckeditor'
  # コールバック用URL
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
  
  resources :posts
  resources :users do
    member do
      get :following, :followers
    end
  end
  resources :relationships,  only: [:create, :destroy]

  root 'home#index'
end
