Rails.application.routes.draw do
  mount Ckeditor::Engine => '/ckeditor'
  devise_for :admins, controllers: {sessions: "admin/sessions"}
  namespace :admin do
    resources :users
  end
  get 'admin_panel', to: "admin_panel#index"
  resources :pass_codes
  resources :questions
  resources :answers
  resources :home
  resources :reports
  resources :people
  get 'about', to: "home#about"
  get 'survey', to: "home#survey"
  post 'survey_entrance', to: "home#survey_entrance"
   get 'survey_entrance', to: "home#survey_entrance"
  post 'survey', to: "home#survey"
  post 'record', to: "home#record"
  get 'record', to: "home#record"
  get 'reportpasscode', to: "reports#reportpasscode"
  post 'reportpasscode', to: "reports#reportpasscode"
  get 'passcode', to: "polls#passcode"
  post 'passcode', to: "polls#passcode"

  root to: "home#index"
  resources :polls do
      post :passCodeCreator, on: :member
  end
end
