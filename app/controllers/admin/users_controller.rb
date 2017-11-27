class Admin::UsersController < AdminController
  before_action :require_admin
  before_action :set_user, only: %i[update destroy]
  def index_user
    @users = User.all
  end

  def new_user
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      log_in @user
      flash[:success] = 'Welcome to MusicDB!'
      redirect_to admin_users_url

    else
      render 'new'
    end
  end

  def user_edit
    @user = User.find(params[:id])
  end

  def update
    if @user.update_attributes(user_params)
      flash[:success] = 'Successfuly updated!'
      redirect_to admin_users_path
    else
      flash[:warning] = 'Pleae try again'
      redirect_to admin_user_edit_path
    end
  end

  def destroy
    @user.destroy
    flash[:success] = 'User Successfuly deleted'
    redirect_to admin_users_path
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:username, :email, :password, :password_confirmation, :is_admin, :remember_digest)
  end
end
