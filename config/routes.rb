Rails.application.routes.draw do

  devise_for :users, :controllers => { :registrations => "registrations"}

  devise_scope :sessions do
    get "users/sign_out", to: "home#index"
  end

  resources :users
  resources :recipes
  resources :tags
  resources :votes

  root 'home#index'
end
