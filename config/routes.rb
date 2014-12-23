Rails.application.routes.draw do
  
  devise_for :users, controllers: {registrations: 'registrations', sessions: 'sessions', confirmations: 'confirmations'}, path: '', :skip => [:confirmations, :passwords]

  devise_scope :user do
    get '/new_confirmation' => 'confirmations#new', :as => :new_user_confirmation
    post '/confirmation' => 'confirmations#create', :as => :user_confirmation
    get '/confirmation' => 'confirmations#show', :as => :show_user_confirmation

    get '/new_password' => 'devise/passwords#new', :as => :new_user_password
    post '/password' => 'devise/passwords#create', :as => :user_password
    get '/password' => 'devise/passwords#edit', :as => :edit_user_password
    put '/password' => 'devise/passwords#update', :as => :update_user_password
  end

  controller :application do
    get '404' => :error_404
    get '422' => :error_422
    get '500' => :error_500
  end

  controller :browse do
    get '/programmers' => :programmers, as: 'show_programmers'
    get '/employers' => :employers, as: 'show_employers'
    get '/jobs' => :jobs, as: 'show_jobs'

    get '/programmer_search' => :programmer_search, as: 'search_programmers'
    get '/employer_search' => :employer_search, as: 'search_employers'
    get '/job_search' => :job_search, as: 'search_jobs'
  end

  controller :contact do
    get '/user/:username/c' => :contact_page, as: 'show_user_contact_page'
    post '/contact' => :send_contact_request, as: 'send_contact_request'
  end

  controller :jobs do
    post '/job/create' => :create, as: 'create_job'
    delete '/job/destroy' => :destroy, as: 'destroy_job'
    get '/job/:id' => :show, as: 'show_job'
    get '/job/:id/edit' => :edit, as: 'edit_job'
    patch '/job/:id/update' => :update, as: 'update_job'
  end

  controller :user_info do
    get '/user/:username' => :show, as: 'show_user'
  end

  controller :watchings do
    post '/watching/create' => :create, as: 'create_watching'
    delete '/watching/destroy' => :destroy, as: 'destroy_watching'
  end

  controller :works do
    post '/work/create' => :create, as: 'create_work'
    delete '/work/:id/destroy' => :destroy, as: 'destroy_work'
    get '/work/:id/edit' => :edit, as: 'edit_work'
    patch '/work/:id/update' => :update, as: 'update_work'
  end

  root 'user_info#index'

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

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
