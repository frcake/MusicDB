class AdminController < ApplicationController
  #before_action :require_admin
  def index
    @albums = Album.all
    @songs = Song.all
    @aritsts = Artist.all
    @bands = Band.all
  end
  #
  # def require_admin
  #   unless current_user.is_admin?
  #     redirect_to root_path
  #   end
  # end
end
