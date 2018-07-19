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
    resources :users
    root "static_pages#home"
  end
end
