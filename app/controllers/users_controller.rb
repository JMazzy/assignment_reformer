class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to new_user_path, notice: "Created new user!"
    else
      flash.now[:alert] = "Failed to create user!"
      render :new
    end
  end

  private

  def user_params
    if params[:user]
      params.require(:user).permit(:username, :email, :password)
    else
      { username: params[:username], email: params[:email], password: params[:password] }
    end
  end
end
