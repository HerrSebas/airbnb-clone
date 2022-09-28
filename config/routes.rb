Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"

  resources :users do
    resources :bookings, only: [:new, :create, :index]
  end
  resources :flats, only: [:index, :show, :new, :create]
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
