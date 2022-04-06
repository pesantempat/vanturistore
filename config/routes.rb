Rails.application.routes.draw do
 
  #resources :loyalty_point_transactions, only: [:update, :edit]
  #resources :loyalty_points
  resources :loyalty_programs, only: [:index], :path => 'loyalty-reward'
  resources :rewards
  get 'customers/index'
  resources :t_mitras, :path => 'mitra'
 get 'home/index' 
  #root :to => 'home#index'

root :to => 'home#landingpage'

  get 'profilmitra' => 't_mitras#profilmitra'

  get 'homecustomer' => 'home#index2'

  get 'kebijakanprivasi' => 'home#kebijakanprivasi'

  post 'verifications' => 'verifications#create'

  patch 'verifications' => 'verifications#verify'
 
 #devise_scope :user do
    #root :to => 'users/sessions#new'
 #end

 devise_for :users, path: 'users', controllers: { sessions: "users/sessions", registrations: "users/registrations", passwords: "users/passwords"}, skip: [:sessions, :registrations]

 resources :users

 devise_scope :user do
  #sessions
  get    'login-admin',  to: 'users/sessions#new',     as: :new_user_session
  post   'login-admin',  to: 'users/sessions#create',  as: :user_session
  delete 'logout', to: 'users/sessions#destroy', as: :destroy_user_session
  #registrations
  put    '/account-admin',  to: 'users/registrations#update'
  delete '/account-admin',  to: 'users/registrations#destroy'
  #post   '/account-admin',  to: 'users/registrations#create'
  #get    '/register', to: 'users/registrations#new',    as: :new_user_registration
  get    '/account-admin',  to: 'users/registrations#edit',   as: :edit_user_registration
  patch  '/account-admin',  to: 'users/registrations#update', as: :user_registration
  get    '/account-admin/cancel', to: 'users/registrations#cancel', as: :cancel_user_registration# passwords 
  # passwords
  #get   'new-pass',  to: 'devise/passwords#new',    as: :new_user_password
  #get   'edit-pass', to: 'devise/passwords#edit',   as: :edit_user_password
  #patch 'edit-pass', to: 'devise/passwords#update', as: :user_password
  #post  'new-pass',  to: 'devise/passwords#create', as: :user_password
end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

devise_for :customers, path: 'customers', controllers: { sessions: "customers/sessions", registrations: "customers/registrations", passwords: "customers/passwords", confirmations: "customers/confirmations", omniauth_callbacks: "customers/omniauth_callbacks"}, skip: [:sessions, :registrations]

resources :customers

devise_scope :customer do
  #sessions
  get    'login-customer',  to: 'customers/sessions#new',     as: :new_customer_session
  post   'login-customer',  to: 'customers/sessions#create',  as: :customer_session
  delete 'logout-customer', to: 'customers/sessions#destroy', as: :destroy_customer_session
  #registrations
  put    '/account-customer',  to: 'customers/registrations#update'
  delete '/account-customer',  to: 'customers/registrations#destroy'
  post   '/account-customer',  to: 'customers/registrations#create'
  get    '/register-customer', to: 'customers/registrations#new',    as: :new_customer_registration
  get    '/account-customer-update',  to: 'customers/registrations#edit',   as: :edit_customer_registration
  patch  '/account-customer',  to: 'customers/registrations#update', as: :customer_registration
  get    '/account-customer/cancel', to: 'customers/registrations#cancel', as: :cancel_customer_registration# passwords 
  # passwords
  #get   'new-pass',  to: 'customers/passwords#new',    as: :new_customer_password
  #get   'edit-pass', to: 'customers/passwords#edit',   as: :edit_customer_password
  #patch 'edit-pass', to: 'customers/passwords#update', as: :customer_password
  #post  'new-pass',  to: 'customers/passwords#create', as: :customer_password
end


  resources :users do
    resources :t_mitras, :path => 'mitra'
  end

  resources :t_mitras, :path => 'mitra' do
    get 'myreward' => 'loyalty_programs#my_reward'
    resources :loyalty_programs, :path => 'loyalty-reward'
    get 'redeemed' => 'loyalty_programs#redeemed'
     resources :loyalty_point_transactions, :path => 'point-transaction'
  end

   resources :customers do
    get 'mypoint' => 'loyalty_points#mypoint'
    resources :t_mitras, :path => 'mitra'
    resources :loyalty_points, :path => 'point' do
      resources :loyalty_point_transactions, :path => 'point-transaction'
    end
  end
  
end
