Rails.application.routes.draw do
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".
  root 'welcome#index'

  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  get '/logout' => 'sessions#destroy'

  get '/signup' => 'users#new'

  get '/courses' => 'courses#index', as: :courses
  get '/courses/:course_id' => 'courses#show', as: :course
  post '/courses/:course_id/register' => 'registrations#create',
       as: :new_registration
  delete '/courses/:course_id/cancel' => 'registrations#delete',
         as: :delete_registration

  get 'registration/new'

  resources :users

  # Paths related to admin
  get '/admin' => 'admin#index', as: :admin
  namespace :admin do
    resources :categories, :programs, :courses,
              :lessons, :users, :course_schedules, :lesson_schedules
  end

  # Example resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end

  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable
end
