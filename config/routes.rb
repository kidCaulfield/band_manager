Rails.application.routes.draw do

  namespace :v1, defaults: {format: :json} do
    resources :venues, only: [:show, :index, :create, :destroy]
    resource :session, only: [:create, :destroy]
  end

end
