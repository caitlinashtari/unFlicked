Rails.application.routes.draw do
  devise_for :users
  root to: "home#index"

  resources :users, :only => [:index] do
    resources :posts
  end

  resources :users, :only => [:show] do
    resources :tags
  end

  resources :posts do

  end
end
