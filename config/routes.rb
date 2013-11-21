Syntaxair::Application.routes.draw do
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
root to: 'users#home'

resources :scraps
post '/scraps/new' => 'scraps#new'
get '/scraps/index/api' => 'scraps#show_json'

resources :users, only: [:new, :create, :index]
delete '/users/new' => 'authentications#destroy'

resources :authentications, only: [:new, :create]


resources :scraps, except: [:index] do
  match '/up-vote', to: 'votes#up_vote', as: :up_vote, via: [:post, :get]
  match '/down-vote', to: 'votes#down_vote', as: :down_vote, via: [:post, :get]
end



get 'search' => 'scraps#search'
post 'search' => 'scraps#search_results'
post '/scraps/:id' => 'scraps#search_results'

post '/users/:id/i_follow' => 'users#follow'



  # Example of regular rosute:
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
