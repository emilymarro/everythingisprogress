Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  # devise_for :admins, path: 'admin', skip: :registrations
  resources :days
  resources :activities
  resources :users
end
