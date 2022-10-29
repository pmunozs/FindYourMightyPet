Rails.application.routes.draw do
  root to: "pages#home"
  get "about", to: "pages#about"

  get "my_profile", to: "pages#my_profile"
  devise_for :users
  resources :creatures do
    get "adopt", to: "creatures#adopt"
  end
end
