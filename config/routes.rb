Rails.application.routes.draw do
  mount Ckeditor::Engine => '/ckeditor'
  devise_for :users
  resources :posts
  resources :users do
    member do
      get :following, :followers
    end
  end
  resources :relationships,  only: [:create, :destroy]

  root 'home#index'
end
