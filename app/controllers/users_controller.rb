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

  end

  def update

  end

  private

  def user_params
    params.require(:user).permit(:username,:email,:is_admin)
  end
end
