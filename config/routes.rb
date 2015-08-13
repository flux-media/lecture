Rails.application.routes.draw do
  get 'admin/index'

  get 'registration/new'

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

  get '/users/:user_id' => 'users#show', as: :show_user
  post '/users' => 'users#create', as: :new_user

  # Paths related to admin

  get '/admin' => 'admin#index', as: :admin

  get '/admin/programs' => 'programs#index', as: :admin_program
  get '/admin/programs/new' => 'programs#new'
  get '/admin/programs/edit/:id' => 'programs#edit',
      as: :admin_edit_program
  post '/admin/programs/new' => 'programs#create'
  delete '/admin/programs/:id' => 'programs#delete',
         as: :admin_delete_program
  patch '/admin/programs/new' => 'programs#update'

  get '/admin/courses' => 'courses#index', as: :admin_course
  get '/admin/courses/new' => 'courses#new'
  get '/admin/courses/edit/:id' => 'courses#edit',
      as: :admin_edit_course
  post '/admin/courses/new' => 'courses#create'
  delete '/admin/courses/:id' => 'courses#delete',
         as: :admin_delete_course
  patch '/admin/courses/new' => 'courses#update'

  get '/admin/lessons' => 'lessons#index', as: :admin_lesson
  get '/admin/lessons/new' => 'lessons#new'
  get '/admin/lessons/edit/:id' => 'lessons#edit',
      as: :admin_edit_lesson
  post '/admin/lessons/new' => 'lessons#create'
  delete '/admin/lessons/:id' => 'lessons#delete',
         as: :admin_delete_lesson
  patch '/admin/lessons/new' => 'lessons#update'

  get '/admin/users' => 'users#index', as: :admin_user
  get '/admin/users/new' => 'users#new'
  get '/admin/users/edit/:id' => 'users#edit',
      as: :admin_edit_user
  post '/admin/users/new' => 'users#create'
  delete '/admin/users/:id' => 'users#delete',
         as: :admin_delete_user
  patch '/admin/users/new' => 'users#update'

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

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

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end
