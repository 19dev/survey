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
  post 'survey_entrance', to: "home#survey_entrance"
  get 'survey_entrance', to: "home#survey_entrance"
  get 'survey', to: "home#survey"
  post 'survey', to: "home#survey"
  get 'surveyMobile', to: "home#surveyMobile"
  post 'surveyMobile', to: "home#surveyMobile"
  post 'record', to: "home#record"
  get 'record', to: "home#record"
  get 'reportpasscode', to: "reports#reportpasscode"
  post 'reportpasscode', to: "reports#reportpasscode"
  post 'assignPassCode', to: "people#assignPassCode"
  post 'removePassCodeFromPerson', to: "people#removePassCodeFromPerson"
  root to: "home#index"
  resources :polls do
      post :passCodeCreator, on: :member
  end
end
