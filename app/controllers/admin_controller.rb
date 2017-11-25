class AdminController < ApplicationController
  before_action :require_admin
  def index
    @albums = Album.includes(:songs, %i[band category]).all
  end

  def require_admin
    unless logged_in? && current_user.is_admin?
      redirect_to root_path
      flash[:warning] = 'No Access'
    end
  end
end
