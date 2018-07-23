Rails.application.routes.draw do
  scope "(:locale)", locale: /en|vi/ do
    get "/about", to: "static_pages#about"
    get "/contact", to: "static_pages#contact"
    get "/help", to: "static_pages#help"
    get "/signup", to: "users#new"
    post "/signup",  to: "users#create"
    resources :users
    root "static_pages#home"
  end
end
