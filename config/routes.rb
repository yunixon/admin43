Rails.application.routes.draw do

  mount Ckeditor::Engine => '/ckeditor'
  devise_for :users, controllers: { omniauth_callbacks: 'callbacks' }

  resources :users
  resources :events do
    get 'join', on: :collection
    get 'moderating', on: :collection
    member do
      get 'to_moderate'
      get 'accept'
      get 'reject'
      get 'rewrite'
    end
  end
  resources :resumes do
    member do
      get 'publicate'
    end
  end
  resources :jobs do
    get 'moderating', on: :collection
    member do
      get 'to_moderate'
      get 'accept'
      get 'reject'
      get 'rewrite'
      get 'complete'
    end
  end
  resources :newslines do
    member do
      get 'publicate'
    end
  end

  get :my_resumes, to: 'resumes#my_resumes', as: 'my_resumes'
  get :my_events, to: 'events#my_events', as: 'my_events'
  get :my_jobs, to: 'jobs#my_jobs', as: 'my_jobs'
  get :about, to: 'pages#about', as: 'about'

  match '/users/:id/finish_signup', to: 'users#finish_signup', via: [:get, :patch], as: :finish_signup
  
  # get :add_newsline_element, to: 'newslines#add_newsline_element', as: 'add_newsline_element'

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  root 'pages#home'

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
