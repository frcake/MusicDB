class AlbumsController < ApplicationController
  def index
    if params[:term].nil? || params[:term].empty?
      @albums = Album.all.paginate(page: params[:page] || 1, per_page: 9).includes(:photos)
      @latest_albums = Album.includes(:photos).last(3).reverse
    else
      q = Searchkick.search params[:term], index_name: [Album, Band], model_includes: { Band => [:albums], Album => [:band] }, fields: [:name], match: :word_start

      @bands, @albums = q.results.partition { |r| r.is_a? Band }
      @albums = @bands.map(&:albums).last.to_a - @albums

    end
  end

  def show
    @album = Album.find(params[:id])
  end
end
