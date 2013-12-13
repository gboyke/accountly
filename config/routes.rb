Accountly::Engine.routes.draw do

  root to: 'settings#index'

  get 'settings' => 'settings#index'
  resources :usernames, :only => [:new, :create]
  resources :passwords, :only => [:new, :create]
  resources :emails, :only => [:new, :create]
  resources :users

  match 'new_email(/:token)' => 'confirmation#new_email', as: 'confirm_new_email', via: [:get, :post]

  default_url_options  :host => 'localhost:3000'
end
