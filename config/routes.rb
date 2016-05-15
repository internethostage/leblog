Rails.application.routes.draw do
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  match "/delayed_job" => DelayedJobWeb, :anchor => false, via: [:get, :post]

  # You can have the root of your site routed with "root"
  root 'home#index'

  get 'about' => 'home#about'

  get "/auth/twitter", as: :sign_in_with_twitter
  get "/auth/:provider/callback" => "callbacks#index"

  resources :sessions, only: [:new, :create] do
    delete :destroy, on: :collection
  end

  resources :password_resets, only: [:new, :create, :edit, :update]

  resources :users, only: [:new, :create, :edit, :update]

  resources :posts do
    resources :comments
    resources :favourites, only: [:create, :destroy]
  end

  namespace :api, defaults: {format: :json} do
    namespace :v1 do
      resources :posts
    end
  end

  get       "/favourites"     => "favourites#index",   as: :user_favourite_posts
  # get     "/posts"          => "posts#index",   as: :posts
  # post    "/posts"          => "posts#create"
  # get     "/posts/new"      => "posts#new",     as: :new_post
  # get     "/posts/:id/edit" => "posts#edit",    as: :edit_post
  # get     "/posts/:id"      => "posts#show",    as: :post
  # patch   "/posts/:id"      => "posts#update"
  # delete  "/posts/:id"      => "posts#destroy"



  # get       "/comments/new"       => "comments#new",    as: :new_comment
  # post      "/comments"           => "comments#create", as: :comments
  # get       "/comments/:id"       => "comments#show",   as: :comment
  # get       "/comments"           => "comments#index"
  # get       "/comments/:id/edit"  => "comments#edit",   as: :edit_comment
  # patch     "/comments/:id"       => "comments#update"
  # delete    "/comments/:id"       => "comments#destroy"



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
