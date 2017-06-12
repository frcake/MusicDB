class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include SessionsHelper

  def index
    if params[:term].nil? || params[:term].empty?
      @albums = Album.all
      @bands = Band.all
      #@artist = Artist.all
    else
      @albums = Album.search params[:term], fields: [:name] , match: :word_start
      @bands = Band.search params[:term] , fields: [:name], match: :word_start
    end
  end
end
