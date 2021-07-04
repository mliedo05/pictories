Rails.application.routes.draw do

  root 'stories#index'

  resources :sessions, only: [:new, :create, :destroy] 
  resources :users, only: [:new, :create, :show] 
  resources :stories
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
