Rails.application.routes.draw do

  resources :friendships
  resources :users

  get    'sessions/login'   => 'sessions#new'
  post   'sessions'         => 'sessions#create'
  delete 'sessions/destroy' => 'sessions#destroy'

  resources :games
  post 'games/:id/upvote' => 'games#upvote'
  post 'games/:id/downvote' => 'games#downvote'

  resources :games do
    resources :comments
    get    'tags/new'  => 'tags#new'
    post   'tags'      => 'tags#create'
    post   'game_users'=> 'games#collect'
    delete 'game_users'=> 'games#uncollect'
  end


  resources :tags, only: [:index, :show]

  get 'map' => 'map#index'


  # post 'friendships' => 'friendships#create'
  # put 'friendships/:id' => 'friendships#update'
  # delete 'friendships/:id' => 'friendships#destroy'
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  root 'games#index'

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
