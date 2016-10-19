Rails.application.routes.draw do

  devise_for :users,
    controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
    root to: 'pages#home'

  resources :beers do
    resources :wishlists, only: [:create]
  end

  get "dashboard", to: "users#dashboard"



end
