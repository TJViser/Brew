Rails.application.routes.draw do

  devise_for :users,
    controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
    root to: 'pages#home'

  resources :beers do
    resources :wishlists, only: [:new, :create]
  end

  resources :users, only: :update

  resources :reviews, only: :create

  get "dashboard", to: "users#dashboard"
  get "users/edit_profile", to: "users#edit_profile", as: "edit_user_profile"
  get "users/:id", to: "users#profile", as: "user_profile"
  post "send_beer/:id", to: "wishlists#send_beer", as: "send_beer"

end
