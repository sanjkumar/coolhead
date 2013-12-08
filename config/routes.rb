Coolheadz::Application.routes.draw do

  root :to => 'site#index'

  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  resources :profiles
  resources :products
  resources :brands
  resources :categories

  devise_for :users do
    resources :orders
      ActiveAdmin.routes(self)
  end


  resources :orders do
    resources :orderproducts
  end

  get 'cart/index'
  get 'cart/show'

  get 'site/index'
  get 'site/about'
  get 'site/contact'
  get 'site/delivery_returns'
  get 'site/privacy_policy'
  get 'site/safe_shopping'

  get 'orderproducts/index'
  get 'orderproducts/new'
  get 'orderproducts/show'
  get 'orderproducts/edit'
  get 'products/category'

  match '/cart' => 'cart#index'
  match '/cart' => 'cart#show'
  match '/cart/:id' => 'cart#add'
  match '/cart/remove/:id' => 'cart#remove'
  match '/clearCart' => 'cart#clearCart'
  match '/checkout' => 'cart#createOrder'
  match '/myprofile' => 'profiles#myprofile'

  match '/about' => 'site#about'
  match '/contact' => 'site#contact'
  match '/delivery_returns' => 'site#delivery_returns'
  match '/privacy_policy' => 'site#privacy_policy'
  match '/safe_shopping' => 'site#safe_shopping'

  match '/search' => 'products#search'
  match '/category/:id' => 'products#category'

  #get 'home/index'


  # The priority is based upon order of creation:
  # first created -> highest priority.

  # Sample of regular route:
  #   match 'products/:id' => 'catalog#view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   match 'products/:id/purchase' => 'catalog#purchase', :as => :purchase
  # This route can be invoked with purchase_url(:id => product.id)

  # Sample resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Sample resource route with options:
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

  # Sample resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Sample resource route with more complex sub-resources
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', :on => :collection
  #     end
  #   end

  # Sample resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end

  # You can have the root of your site routed with 'root'
  # just remember to delete public/index.html.


  # See how all your routes lay out with 'rake routes'

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id))(.:format)'
end
