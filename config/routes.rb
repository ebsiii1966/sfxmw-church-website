Sfxmw::Application.routes.draw do

  get 'admin' => 'admin#index'
  
  controller :sessions do
    get 'login' => :new
    post 'login' => :create
    delete 'logout' => :destroy
  end  

  # get "home/index"

  resources :users
  match '/change_pw' => 'users#change_pw', :as => :change_pw

  resources :orgs
  
  resources :news_items
  match '/feed' => 'news_items#feed', :as => :feed, :defaults => { :format => 'rss' }

  resources :series

    
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

  match 'home' => "home#index"
  match 'general' => "home#general"
  match 'forms' => "home#forms"
  match 'links' => "home#links"
  match 'directions' => "home#directions"
  match 'welcome' => "home#welcome"
  
  match 'style_a' => "admin#style_a"
  match 'style_b' => "admin#style_b"
  match 'style_c' => "admin#style_c"

  # You can have the root of your site routed with "root"
  # just remember to delete public/index.html.
  root :to => "home#index"

  # For mail
  match 'contact' => 'contact#new', :as => 'contact', :via => :get
  match 'contact' => 'contact#create', :as => 'contact', :via => :post
  
  # For twitter
  match 'twitter' => 'twitter#new', :as => 'twitter', :via => :get
  match 'twitter' => 'twitter#create', :as => 'twitter', :via => :post
  match 'twitterbatch' => 'twitter#batch'
  #match 'twitter' => 'twitter#show', :as => 'twitter', :via => :get
    
  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id(.:format)))'
end
