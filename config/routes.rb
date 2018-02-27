Rails.application.routes.draw do
  get 'links/index'

  get 'instructions/index'

  get 'about/index'

  get 'home/index'

  # devise_for :users

  devise_for :users do
    get "/users/sign_out" => "devise/sessions#destroy", :as => :destroy_user_session
  end

  devise_scope :user do
    get '/users/sign_out' => 'devise/sessions#destroy'
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  # devise_for :admins, path: 'admin', skip: :registrations
  root to: "home#index"
  resources :about
  resources :days
  resources :activities
  resources :users
  resources :instructions
end

