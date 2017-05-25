class AdminController < ApplicationController
  #before_action :require_admin
  def index
  end
  #
  # def require_admin
  #   unless current_user.is_admin?
  #     redirect_to root_path
  #   end
  # end
end
