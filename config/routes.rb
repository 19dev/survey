Rails.application.routes.draw do
  devise_for :admins, controllers: {sessions: "admin/sessions"}
  namespace :admin do
    resources :users
  end
  get 'admin_panel', to: "admin_panel#index"
  resources :pass_codes
  resources :questions
  resources :answers
  resources :home
  get 'about', to: "home#about"
  get 'survey', to: "home#survey"
  post 'survey', to: "home#survey"
  post 'record', to: "home#record"
  get 'record', to: "home#record"

  root to: "home#index"
  resources :polls do
      post :passCodeCreator, on: :member
  end
  get 'records', to: "records#index"
end
