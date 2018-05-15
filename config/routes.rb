Rails.application.routes.draw do
  
  resources :wechats, only: [:index, :create]

  namespace :groupon, path: 'g' do
    resources :coupons do
      member do
        get :rebuy_checked
      end
    end
    resources :groups
    resources :ucenter, only: :index do
      collection do
        get 'cs'
      end
    end
  end

  namespace :auction do
    resources :trades, except: [:destroy] do
      member do
        put  :cancel
        get  :checkout
        get  :wechat_query
        # post :wechat_return
      end
      collection do
        get  :defray
        get  :closely_gift
        get  :gift_show
        post :red_packet
      end
    end

    resources :contacts do
      collection do
        get :get_cities
        get :get_towns
      end
      
      member do
        get :supplement
        put :submission
      end
    end
  end
  
  # 送礼购物
  namespace :gift do
    resources :trades, except: [:destroy] do
      collection do
        get  :opt
        get :receiving_gifts
        post :reward
      end
      member do
        get :get
        get :forward
        put :received_gifts
        get :received_results
      end
    end
    resources :products do
      collection do
        get :brand
      end
    end
    resources :ucenter, only: :index
    
    resources :contacts do
      collection do
        get :get_cities
        get :get_towns
      end
      
      member do
        get :supplement
        put :submission
      end
    end
  end

  namespace :core do
    resources :connections, only: :new do
      collection do
        get 'callback'
      end
    end
  end

  namespace :wechat do
    resources :invitations, only: [:index, :show] do
      member do
        get :share
        get :user_info
      end
    end
  end
    
  get '/logout' => 'core/sessions#logout'

  root 'groupon/coupons#index'

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
