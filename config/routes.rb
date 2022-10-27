Rails.application.routes.draw do
  root to: "pages#home"
  get "about", to: "pages#about"
  devise_for :users
  resources :creatures do
    get "adopt", to: "creature#adopt"
  end
end
