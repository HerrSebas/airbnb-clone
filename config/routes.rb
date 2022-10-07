Rails.application.routes.draw do

  devise_for :users
  root to: "pages#home"
  get "/pages/profile", to: "pages#profile"

  resources :flats, only: [:index, :show, :new, :create, :edit, :update, :destroy] do
    resources :bookings, only: [:new, :create]
    resources :reviews, only: [:new, :create, :index]
  end


  resources :bookings, only: [:index]
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
