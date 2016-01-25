Rails.application.routes.draw do
  devise_for :admins, controllers: {sessions: "admin/sessions"}
  # resources :admins
  resources :pass_codes
  resources :questions
  resources :answers
  resources :home
  get 'about', to: "home#about"
  root to: "home#index"
  resources :polls
  get 'admin_panel', to: "admin_panel#index"
  resources :users

end
