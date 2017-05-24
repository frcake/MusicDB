class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def show
    @user = User.find(params[:id])
  end

  def index

  end

  def create
    @user = User.new(params[:user])
    if @user.save

    end
  end

  def update

  end

  private

  def user_params
    params.require(:user).permit(:username,:email,:password,:password_confirmation,:is_admin)
  end
end
