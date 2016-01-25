Rails.application.routes.draw do
  devise_for :admins, controllers: { sessions: 'sessions'}
  resources :pass_codes
  resources :questions
  resources :answers
  resources :home
  get 'about', to: "home#about"
  root to: "home#index"
  resources :polls
  resources :admins do
    resources :users , except: [:show] do
      get :add_admin, on: :member
      get :delete_admin, on: :member
    end
  end
end
