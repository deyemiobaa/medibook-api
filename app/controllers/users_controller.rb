class UsersController < ApplicationController
  skip_before_action :authenticate_request

  def create
    user = User.new(user_params)
    if user.save
      render json: { message: 'sign up succesful', status: :created }
    else
      render json: user.errors, status: :unprocessable_entity
    end
  end

  private

  def user_params
    params.require(:user).permit(:username, :password, :password_confirmation)
  end
end
