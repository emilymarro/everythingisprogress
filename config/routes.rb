Rails.application.routes.draw do
  get 'instructions/index'

  get 'about/index'

  get 'home/index'

  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  # devise_for :admins, path: 'admin', skip: :registrations
  root to: "home#index"
  resources :about
  resources :days
  resources :activities
  resources :users
end
