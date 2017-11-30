Rails.application.routes.draw do
  root :to => 'images#index'

  resources :images do
    resources :comments
  end

  resources :profile

  devise_for :users

  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
