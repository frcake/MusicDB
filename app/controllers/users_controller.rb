class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def show
    @user = User.includes(
      :record_libraries,
      [record_libraries: :user],
      :inverse_friends,
      :friendships,
      friendships: [:friend],
      albums: [:photos]
    ).find(params[:id])
  end

  def index
    @users = User.all.paginate(page: params[:page] || 1, per_page: 15)
  end

  def create
    @user = User.new(user_params)

    if @user.save
      # TODO: Use this to create needed vectors upon user creation
      unless @user.user_vector
        @user.user_vector = UserVector.new
        @user.save
      end
      unless @user.music_recommendation
        @user.music_recommendation = MusicRecommendation.new
        @user.save
      end
      log_in @user
      flash[:success] = 'Welcome to MusicDB!'
      redirect_to @user

    else
      render 'new'
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update_attributes(user_params)
      flash[:success] = 'Successfuly updated!'
      redirect_to @user
    else
      render 'edit'
    end
  end

  private

  def user_params
    params.require(:user).permit(:username, :email, :password, :password_confirmation, :is_admin, :remember_digest)
  end
end
