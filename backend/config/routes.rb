# Rails.application.routes.draw do
#   get 'sessions/create'
#   get 'sessions/destroy'
#   get 'home/show'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  Rails.application.routes.draw do



    namespace :api do
      namespace :v1 do
        resources :games, only: [:index, :create, :destroy, :update]
        resources :game_orders, only: [:index, :create, :destroy, :update]
        resources :orders, only: [:index, :create, :destroy, :update]
        resources :store, only: [:index, :create, :destroy]
        resources :admin, only: [:index,:show, :create, :destroy, :update]
        resources :sessions, only: [:create]

post '/signup/', to: 'auth#signup'
get '/admin/:admin_id/games', to: 'admin#all_games'
      end
    end



end
