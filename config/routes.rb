Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  devise_for :users, controllers: { registrations: 'registrations' }
  root to: "home#index"
  resources :posts do
    resources :comments
  end
  match '/users/:id', to: 'users#show', via: 'get'
  resources :users, :only => [:show]

end
