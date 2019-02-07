# Basic rails api Setup for React frontend

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

Generate models, controllers, serializers and ability file. And Migrate

```shell
rails g model User first_name last_name email password_digest
rails g model Venue name vicinity longitude latitude

rails g controller users
rails g controller sessions
rails g controller venues

rails g serializer Venue
rails g serializer User

rails g cancan:ability

rails db:migrate
```

and now your ready to code 👾

### Minimal Setup of models for testing API with postman

Make sure to set up has_secrue_password in your user model

```rails
has_secure_password
    
validates :email,   presence: true,
                    uniqueness: true,
                    format: /\A([\w+\-].?)+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i

def full_name
    "#{first_name} #{last_name}".strip
end
```

also not the worst idea to set up your email validation and full_name method while your there.

to be continued... 🤖

# Build minimal CRUD actions for teting your API controllers with postman

setup routes

```rails
namespace :v1, defaults: {format: :json} do
  resources :venues, only: [:show, :index, :create, :destroy]
  resource :session, only: [:create, :destroy]
  resource :user, only: [:create]
end
```

###Create methods venues API controller ready to interact with your frontend

```rails
def index
  venues = Venue.order(created_at: :desc)
  render json: venues
end

def show
  render json: venue
end

def create
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

### Next up Users API Controller

```rails
def create
  # binding.pry
  @user = User.new user_params
  if @user.save
    session[:user_id] = @user.id
    render json: {
      status: 200
      }
  else
    render json: {
      status: 422,
      errors: @user.errors
    }
  end
end

private
def user_params
  params.require(:user).permit(
    :first_name, :last_name, :email, :password, :password_confirmation
  )
end
```

### Sessions controller

```rails
def create
    binding.pry
    user = User.find_by(email: params[:email])
    if user&.authenticate(params[:password])
      session[:user_id] = user.id
      render json: {id: user.id}
    else
      render json: {status: 404}, status: 404
    end
  end

  def destroy
    session[:user_id] = nil
    render json: {status: 200}, status: 200
  end
```