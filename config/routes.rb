Rails.application.routes.draw do
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".
  root 'welcome#index'

  get '/login' => 'sessions#new', as: :login
  post '/login' => 'sessions#create'
  get '/logout' => 'sessions#destroy', as: :logout
  get '/signup' => 'users#new', as: :sign_up

  post '/signup_by_provider' => 'sessions#new_by_provider',
       as: :sign_up_by_provider
  post '/reset_password' => 'users#reset_password',
       as: :reset_password

  get '/sessions/new_from_token/:user_id/:key' => 'sessions#new_from_token'

  resources :users, :payments, :inquiries

  resources :courses do
    resources :registrations
  end

  # Paths related to admin
  get '/admin' => 'admin#index', as: :admin
  get '/admin/logout' => 'admin/sessions#destroy', as: :admin_sessions_destroy
  namespace :admin do
    resources :categories, :courses, :teachers, :users, :registrations, :sessions
  end

  patch '/admin/update' => 'admin#update', as: :admin_config

  get '/404', :to => 'welcome#not_found'
  get '/422', :to => 'welcome#unacceptable'
  get '/500', :to => 'welcome#internal_error'

end
