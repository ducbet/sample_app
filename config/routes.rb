Rails.application.routes.draw do

  scope "(:locale)", locale: /en|vi/ do
    delete "/logout", to: "sessions#destroy"
    get "/about", to: "static_pages#about"
    get "/contact", to: "static_pages#contact"
    get "/help", to: "static_pages#help"
    get "/login", to: "sessions#new"
    get "/signup", to: "users#new"
    post "/login", to: "sessions#create"
    post "/signup", to: "users#create"
    resources :account_activations, only: [:edit]
    resources :microposts, only: [:create, :destroy]
    resources :password_resets, only: [:new, :create, :edit, :update]
    resources :relationships, only: [:create, :destroy]
    resources :users do
      member do
        resources :followings, only: [:index]
        resources :followers, only: [:index]
      end
    end
    root "static_pages#home"
  end
end
