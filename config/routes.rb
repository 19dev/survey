Rails.application.routes.draw do
  resources :pass_codes
  resources :questions
  resources :answers
  root 'home#index'
  resources :polls
end
