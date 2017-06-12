class AlbumsController < ApplicationController

  def index
    #@albums = Album.all
    if params[:term].nil?
      @albums = Album.all
    else
      @albums = Album.search params[:term]
    end
  end

  def show
    @album = Album.find(params[:id])
  end

  private
end
