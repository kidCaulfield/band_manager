Rails.application.routes.draw do

  namespace :v1, defaults: {format: :json} do
    resources :tours, shallow: true, only: [:create, :show] do
      resources :events, only: [:create]
    end
    resources :venues, only: [:show, :index, :create, :destroy]
    resources :reviews, only: [:destroy]
    resource :session, only: [:create, :destroy]
    resources :users, only: [:create] do
      # get :current # /api/v1/users/:user_id/current
      get :current, on: :collection # /api/v1/users/current
      # get :current, on: :member # /api/v1/users/:id/current
    end
  end

end
