Rails.application.routes.draw do
 
 get 'home/index'
  #root :to => 'home#index'

 devise_for :users, path: 'users', controllers: { sessions: "users/sessions", registrations: "users/registrations"}, skip: [:sessions, :registrations]

 devise_scope :user do
  	root :to => 'users/sessions#new'
 end

 devise_scope :user do
  #sessions
  get    'login_kpi',  to: 'users/sessions#new',     as: :new_user_session
  post   'login_kpi',  to: 'users/sessions#create',  as: :user_session
  delete 'logout', to: 'users/sessions#destroy', as: :destroy_user_session
  #registrations
  put    '/account',  to: 'users/registrations#update'
  delete '/account',  to: 'users/registrations#destroy'
  post   '/account',  to: 'users/registrations#create'
  get    '/register', to: 'users/registrations#new',    as: :new_user_registration
  get    '/account',  to: 'users/registrations#edit',   as: :edit_user_registration
  patch  '/account',  to: 'users/registrations#update', as: :user_registration
  get    '/account/cancel', to: 'users/registrations#cancel', as: :cancel_user_registration# passwords 
  # passwords
  #get   'new-pass',  to: 'devise/passwords#new',    as: :new_user_password
  #get   'edit-pass', to: 'devise/passwords#edit',   as: :edit_user_password
  #patch 'edit-pass', to: 'devise/passwords#update', as: :user_password
  #post  'new-pass',  to: 'devise/passwords#create', as: :user_password
end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
