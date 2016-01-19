Rails.application.routes.draw do
  devise_for :admins
  resources :pass_codes
  resources :questions
  resources :answers
  root to: 'home#index'
  resources :polls
  resources :admins
end
