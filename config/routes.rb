Rails.application.routes.draw do
  devise_for :users

  namespace :admin do
    resources :users
  end
  post 'create_user' => 'admin/users#create', as: :create_user
  
  resources :profile
  
  resources :timesheet
  #get 'timesheet' => 'timesheet#index'
  get 'timesheet/previous' => 'timesheet#previous'
  get 'timesheet/:id/starttime' => 'timesheet#starttime', as: :timesheet_starttime
  get 'timesheet/:id/finishshift' => 'timesheet#finishshift', as: :timesheet_finishshift
  get 'timesheet/:id/reopenshift' => 'timesheet#reopenshift', as: :timesheet_reopenshift

  resources :breaks
  post 'breaks/:id/finish' => 'breaks#finish', as: :break_finish

  get 'home/index'

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  root 'home#index'

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
