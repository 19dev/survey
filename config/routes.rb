Rails.application.routes.draw do
  devise_for :admins, controllers: {sessions: "admin/sessions"}
  namespace :admin do
    resources :users
  end
  get 'admin_panel', to: "admin_panel#index"
  resources :pass_codesc
  resources :questions
  resources :answers
  resources :home
  get 'about', to: "home#about"
  root to: "home#index"
  resources :polls
  get 'records', to: "records#index"
end
