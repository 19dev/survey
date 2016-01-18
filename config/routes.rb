Rails.application.routes.draw do
  resources :questions
  resources :answers
  root 'home#index'
  resources :polls
end
