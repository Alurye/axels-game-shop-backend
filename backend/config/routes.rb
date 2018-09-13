# Rails.application.routes.draw do
#   get 'sessions/create'
#   get 'sessions/destroy'
#   get 'home/show'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  Rails.application.routes.draw do



    namespace :api do
      namespace :v1 do
        resources :games, only: [:index, :create, :show, :destroy, :update]
        resources :game_orders, only: [:index, :create, :show, :destroy, :update]
        resources :orders do
                resources :games
            end
        resources :store, only: [:index, :create, :destroy]
        resources :admin, only: [:index,:show, :create, :destroy, :update]
        resources :sessions, only: [:create]
        resources :charges

post '/signup/', to: 'auth#signup'
get '/admin/:admin_id/games', to: 'admin#all_games'
get '/admin/:admin_id/orders', to: 'admin#all_orders'

      end
    end



end
