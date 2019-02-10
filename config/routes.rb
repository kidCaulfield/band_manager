Rails.application.routes.draw do

  namespace :v1, defaults: {format: :json} do
    resources :venues, shallow: true, only: [:show, :index, :create, :destroy] do
      resources :reviews, only: [:show, :index, :create, :destroy]
    end
    resource :session, only: [:create, :destroy]
    resources :users, only: [:create]
  end

end
