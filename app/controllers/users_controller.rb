class UsersController < ApplicationController

  before_action :custom_authenticate_user!, only: [:sign_out]

  def create
    @user = User.new(user_params)
    if @user.save
      render json: :null, status: :created
    else
      render json: { errors: @user.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def sign_in
    @user = User.where(email: params[:email]).first
    render json: { errors: ['Invalidate email/password'] }, status: :unprocessable_entity unless @user
    if @user.valid_password?(params[:password])
      @user.reset_authentication_token
      render json: @user, status: :created
    else
      render json: { errors: ['Invalidate email/password'] }, status: :unprocessable_entity
    end
  end

  def sign_out
    if @current_user.logout
      render json: :null, status: :ok
    else
      render json: { errors: ['Token already Invalidate'] }, status: :not_found
    end
  end

  private
    def user_params
      params.require(:user).permit(:name, :email, :password, :password_confirmation)
    end

end
