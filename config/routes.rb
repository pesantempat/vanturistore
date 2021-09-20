Rails.application.routes.draw do
 
  resources :t_mitras, :path => 'mitra'
 get 'home/index' 
  #root :to => 'home#index'

  get 'profilmitra' => 't_mitras#profilmitra'

  get 'homecustomer' => 'home#index2'
 
 devise_scope :user do
    root :to => 'users/sessions#new'
 end

 devise_for :users, path: 'users', controllers: { sessions: "users/sessions", registrations: "users/registrations"}, skip: [:sessions, :registrations]

 resources :users

 devise_scope :user do
  #sessions
  get    'loginbisniscepat',  to: 'users/sessions#new',     as: :new_user_session
  post   'loginbisniscepat',  to: 'users/sessions#create',  as: :user_session
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

devise_for :customers, path: 'customers', controllers: { sessions: "customers/sessions", registrations: "customers/registrations"}, skip: [:sessions, :registrations]

devise_scope :customer do
  #sessions
  get    'logincustomer',  to: 'customers/sessions#new',     as: :new_customer_session
  post   'logincustomer',  to: 'customers/sessions#create',  as: :customer_session
  delete 'logoutcustomer', to: 'customers/sessions#destroy', as: :destroy_customer_session
  #registrations
  put    '/accountcustomer',  to: 'customers/registrations#update'
  delete '/accountcustomer',  to: 'customers/registrations#destroy'
  post   '/accountcustomer',  to: 'customers/registrations#create'
  get    '/registercustomer', to: 'customers/registrations#new',    as: :new_customer_registration
  get    '/accountcustomer',  to: 'customers/registrations#edit',   as: :edit_customer_registration
  patch  '/accountcustomer',  to: 'customers/registrations#update', as: :customer_registration
  get    '/accountcustomer/cancel', to: 'customers/registrations#cancel', as: :cancel_customer_registration# passwords 
  # passwords
  #get   'new-pass',  to: 'devise/passwords#new',    as: :new_user_password
  #get   'edit-pass', to: 'devise/passwords#edit',   as: :edit_user_password
  #patch 'edit-pass', to: 'devise/passwords#update', as: :user_password
  #post  'new-pass',  to: 'devise/passwords#create', as: :user_password
end


  resources :users do
    resources :t_mitras, :path => 'mitra'
  end

end
