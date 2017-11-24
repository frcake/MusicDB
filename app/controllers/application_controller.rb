class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include SessionsHelper
  before_action do
  end
  before_action do
  end

  rescue_from ActiveRecord::RecordNotFound do
    flash[:warning] = 'Resource not found.'
    redirect_back_or root_path
  end

  def redirect_back_or(path)
    redirect_to request.referer || path
  end

  def index
    # if params[:term].nil? || params[:term].empty?
    #   @albums = Album.all.paginate(page: params[:page] || 1, per_page: 9).includes(:photos)
    #   @bands = Band.all
    # else
    #   @albums = Album.includes(:photos).search params[:term], fields: [:name], match: :word_start
    #   @bands = Band.search params[:term], fields: [:name], match: :word_start
    # end
  end
end
