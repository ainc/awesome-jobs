Rails.application.routes.draw do
  
  devise_for :users, controllers: {registrations: 'registrations', sessions: 'sessions', confirmations: 'confirmations'}, path: ''

  controller :application do
    get '404' => :error_404
    get '422' => :error_422
    get '500' => :error_500
  end

  controller :browse do
    get '/p' => :programmers, as: 'show_programmers'
    get '/e' => :employers, as: 'show_employers'
    get '/j' => :jobs, as: 'show_jobs'

    get '/ps' => :programmer_search, as: 'search_programmers'
    get '/es' => :employer_search, as: 'search_employers'
    get '/js' => :job_search, as: 'search_jobs'
  end

  controller :contact do
    get '/u/:username/c' => :contact_page, as: 'show_user_contact_page'
    post '/c' => :send_contact_request, as: 'send_contact_request'
  end

  controller :jobs do
    post '/j/create' => :create, as: 'create_job'
    delete '/j/destroy' => :destroy, as: 'destroy_job'
    get '/j/:id' => :show, as: 'show_job'
    get '/j/:id/edit' => :edit, as: 'edit_job'
    patch '/j/:id/update' => :update, as: 'update_job'
  end

  controller :user_info do
    get '/u/:username' => :show, as: 'show_user'
  end

  controller :watchings do
    post '/wa/create' => :create, as: 'create_watching'
    delete '/wa/destroy' => :destroy, as: 'destroy_watching'
  end

  controller :works do
    post '/w/create' => :create, as: 'create_work'
    delete '/w/:id/destroy' => :destroy, as: 'destroy_work'
    get '/w/:id/edit' => :edit, as: 'edit_work'
    patch '/w/:id/update' => :update, as: 'update_work'
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
