class AlbumsController < ApplicationController
  def index
    @albums = Album.paginate(page: params[:page] || 1, per_page: 5)
    # @search = Classified.search(include: %i[photos category flags favorite_classifieds user]) do
    #   paginate(page: params[:page] || 1, per_page: 10)
    # end
  end

  def show
    @album = Album.find(params[:id])
  end

  private
end
