class V1::UsersController < ApplicationController
  # before_action :authenticate_user!

  def current
    render json: {
      status: 200,
      current_user: ActiveModelSerializers::SerializableResource.new(current_user)
    }
  end

  def new
    @user = User.new
  end

  def create
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
end
