Rails.application.routes.draw do
  devise_for :admins, controllers: { sessions: 'sessions'}
  resources :pass_codes
  resources :questions
  resources :answers
  resources :home
  get 'about', to: "home#about"
  root to: "home#index"
  resources :polls
  resources :admins
  resources :users

end
