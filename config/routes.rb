Rails.application.routes.draw do
  get 'static_pages/home'

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  root 'static_pages#new_user'

  # Example of regular route:
  post 'users' => 'user_subscription#create_user'
  post 'messages' => 'user_message#create_message'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  get 'confirm/:confirm_code/:email' => 'user_subscription#confirm_user', constraints: { email: /[^\/]+/ }
  get 'message/:code' => 'user_message#get_message'


  get 'users/new' => 'static_pages#new_user'
  get 'messages/new' => 'static_pages#new_message'
  get 'answers/new/:code' => 'static_pages#answer_message'

  post 'answer' => 'user_message#answer_message'
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
