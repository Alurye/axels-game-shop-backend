Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  Rails.application.routes.draw do
    namespace :api do
      namespace :v1 do
        resources :games, only: [:index, :create, :destroy, :update]
        resources :purchases, only: [:index, :create, :destroy, :update]
        resources :customers, only: [:index, :create, :destroy, :update]
        resources :store, only: [:index, :create, :destroy]
        resources :admin, only: [:index, :create, :destroy, :update]


      end
    end
  end


end
