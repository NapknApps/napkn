Rails.application.routes.draw do

  root 'welcome#index'
  
  get '/treehouse', :to => 'welcome#treehouse'

  get 'apps/carl_is_hungry', :to => 'apps#carl_is_hungry'
  get 'apps/nomojo', :to => 'apps#nomojo'
  get 'apps/envoyer', :to => 'apps#envoyer'
  get 'apps/roll_out', :to => 'apps#roll_out'
  get 'apps/rtab', :to => 'apps#rtab'
  get 'apps/sweet_nothings', :to => 'apps#sweet_nothings'

  get 'posts/', :to => 'posts#index'

  get 'posts/launching_napkn', :to => 'posts#launching_napkn'
  get 'posts/every_submitted_app_idea', :to => 'posts#every_submitted_app_idea'
  get 'posts/calling_all_app_makers', :to => 'posts#calling_all_app_makers'
  get 'posts/unique_gameplay_got_carl_rejected_from_the_app_store', :to => 'posts#unique_gameplay_got_carl_rejected_from_the_app_store'
  get 'posts/creating_roll_out', :to => 'posts#creating_roll_out'
  get 'posts/creating_nomojo', :to => 'posts#creating_nomojo'
  get 'posts/creating_envoyer', :to => 'posts#creating_envoyer'

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
