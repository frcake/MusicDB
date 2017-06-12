class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include SessionsHelper

  def index
    if params[:term].nil? || params[:term].empty?
      @albums = Album.all
    else
      @albums = Album.search params[:term]
    end
  end
end
