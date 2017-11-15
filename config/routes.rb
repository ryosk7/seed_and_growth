Rails.application.routes.draw do
  resources :posts

  root 'homes#index'
end
