### Setting up and api with Rails

Generate your api with rails and create database.


```shell
rails new --api band_manager -d postgresql -T

rails db:create
```

Add gems that apply to your api and project.

```rails
gem 'rack-cors'
gem 'active_model_serializers'
gem 'cancancan'
gem 'cowsay'
gem 'rb-readline'
group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
  gem 'pry'
  gem 'pry-rails'
  gem 'hirb'
end
```

Generate models, controllers, serializers and ability file.

```shell
rails g model User first_name last_name email password_digest
rails g model Venue name vicinity longitude latitude

rails g controller users
rails g controller session
rails g controller venues

rails g serializer Venue
rails g serializer User

rails g cancan:ability
```

and now your ready to code 👾

### Build CRUD actions for your controllers

setup routes

```rails
 namespace :v1, defaults: {format: :json} do
    resources :venues, only: [:show, :index, :create, :destroy]
    resource :session, only: [:create, :destroy]
  end
```

create methods venues controller ready to interact with your frontend

```rails
def index
    venues = Venue.order(created_at: :desc)
    render json: venues
  end

  def show
    render json: venue
  end

  def create
    byebug
    venue = Venue.new venue_params
    
    if venue.save
      render json: {id: venue.id}
    else
      render(
        json: {errors: venue.errors},
        status: 422 # Unprocessable Entity
      )
    end
  end

  def destroy
    venue.destroy
    render(json: {status: 200}, status: 200)
  end

  private

  def venue
    @venue ||= Venue.find params[:id]
  end

  def venue_params
    params.require(:venue).permit(:name, :vicinity, :longitude, :latitude)
  end
```