class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include SessionsHelper
  before_action do
    @discogs = Discogs::Wrapper.new('Test OAuth', user_token: 'uUAcpNNqtCmvrLITnpzKeuxfUcxsQdeGRJRggXqq')
  end
  before_action do
    RSpotify.authenticate('11180b801be74a9a9181777e6f78d5d9', '0e4a3494142b4b24b01f487b3ae6631d')
  end

  def index
    if params[:term].nil? || params[:term].empty?
      @albums = Album.all.paginate(page: params[:page] || 1, per_page: 3)
      @bands = Band.all
    else
      @albums = Album.search params[:term], fields: [:name], match: :word_start
      @bands = Band.search params[:term], fields: [:name], match: :word_start
    end

    #   # ####Api ScrapScript#############
    #
    #   @find_category = Category.find_by(name: 'Rock')
    #   @category_id = @find_category.id
    #   artist_array = ['The Doors',
    #                   'Eagles',
    #                   'Lynyrd Skynyrd',
    #                   'Genesis',
    #                   'U2']
    #
    #   artist_ids = []
    #
    #   artist_array.each do |artist_name|
    #     @result = @discogs.search(artist_name, per_page: 10, type: :artist)
    #     next if @result.nil?
    #     @artist_discogs_name = @discogs.get_artist(@result.results.first.id.to_s)
    #     @artist_discogs_members = @discogs.get_artist(@result.results.first.id.to_s).members
    #     @saveband = Band.new(
    #       name: @artist_discogs_name.name,
    #       description: @artist_discogs_name.profile,
    #       category_id: @category_id
    #     )
    #     @saveband.save
    #
    #     @artist_discogs_members.each do |artist|
    #       @save_artist = Artist.new(
    #         name: artist.name,
    #         category_id: @category_id
    #       )
    #       @save_artist.save
    #       artist_ids << @save_artist.id
    #     end
    #
    #     artist_ids.each do |artist_id|
    #       @bandmembers = @saveband.bandmembers.build(artist_id: artist_id)
    #       @bandmembers.save
    #     end
    #
    #     @artist = RSpotify::Artist.search(artist_name).first
    #     next if @artist.nil?
    #     @band = Band.find_by(name: artist_name)
    #     uniq_album_name = @artist.albums.uniq!(&:release_date).first
    #
    #     @save_album = Album.new(
    #       name: uniq_album_name.name,
    #       release_date: uniq_album_name.release_date,
    #       category_id: @category_id,
    #       band_id: @band.id
    #     )
    #     @save_album.save
    #     @save_album.photos.create(image: URI.parse(uniq_album_name.images[0]['url']))
    #
    #     songs_array = []
    #     uniq_album_name.tracks.each do |song|
    #       @song = Song.new(
    #         name: song.name,
    #         category_id: @category_id
    #       )
    #       @song.save
    #       songs_array << @song
    #     end
    #
    #     songs_array.each do |_song|
    #       @tracks = @song.tracks.build(album_id: @save_album.id)
    #       @tracks.save
    #     end
    #   end
  end
end
