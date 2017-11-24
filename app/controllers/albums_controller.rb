class AlbumsController < ApplicationController
  def index
    import_data
    @latest_albums = Album.includes(:photos).last(10).reverse
    if params[:term].nil? || params[:term].empty?
      @albums = Album.all.paginate(page: params[:page] || 1, per_page: 6).includes(:photos)
    else
      q = Searchkick.search params[:term], index_name: [Album, Band], model_includes: { Band => [:albums], Album => [:band] }, fields: [:name], match: :word_start
      @bands, @albums = q.results.partition { |r| r.is_a? Band }
      @albums = @bands.map(&:albums).last.to_a - @albums

    end
  end

  def show
    @album = Album.find(params[:id])
  end

  def import_data
    @discogs = Discogs::Wrapper.new('Test OAuth', user_token: 'uUAcpNNqtCmvrLITnpzKeuxfUcxsQdeGRJRggXqq')
    RSpotify.authenticate('11180b801be74a9a9181777e6f78d5d9', '0e4a3494142b4b24b01f487b3ae6631d')

    #### rock , metal , punk ,Hip Hop,country,pop,Stoner Rock,'Electronic Death Metal,Blues
    # # ####Api ScrapScript#############

    @find_category = Category.find_by(name: 'Electronica')
    @category_id = @find_category.id
    # artist_array = ['Led Zeppelin', 'The Beatles', 'Pink Floyd', 'Queen', 'AC/DC']
    # artist_array = ['John Mayall & the Bluesbreakers', 'Cream', 'ZZ Top', 'The Allman Brothers Band', 'The Who']
    # artist_array = ['Green Day', 'Dead Kennedys', 'The Clash', 'Misfits', 'Bad Religion']
    # artist_array = ['The Carter Family', 'Bill Monroe and His Blue Grass Boys', 'Alabama', 'The Louvin Brothers', 'Charlie Daniels Band']
    # artist_array = ['Wu-Tang Clan', 'N.W.A.', 'Run-DMC', 'A Tribe Called Quest', 'Public Enemy']
    # artist_array = ['Metallica', 'Iron Maiden', 'Black Sabbath', 'Megadeth', 'Judas Priest']
    # artist_array = ['ABBA', 'Bee Gees', 'The Monkees', 'The Beach Boys', "The B-52's"]
    # artist_array = ['Earth, Wind & Fire', 'Fourplay', 'Incognito', 'Yellowjackets', 'Pieces of a Dream']
    # artist_array = ['Toots & the Maytals', 'Steel Pulse', 'Wailers Band']
    # artist_array = ['The Arctic Monkeys', 'The Strokes', 'Radiohead', 'The Killers', 'Arcade Fire']
    # artist_array = ['Nirvana', 'Linkin Park', 'Radiohead', 'Coldplay', 'The Red Hot Chili Peppers ']
    # artist_array = ['The Supremes', 'The Jackson 5/The Jacksons', 'Earth, Wind & Fire', 'The Isley Brothers', 'The Temptations']
    # artist_array = ['Gorillaz', 'New Order', 'The Prodigy', 'Pet Shop Boys', 'The Chemical Brothers']
    # artist_array = ['The Mothers of Invention', 'The Mahavishnu Orchestra', 'Tangerine Dream', 'The Shadows', 'The Tornados']
    # artist_array = ['Depeche Mode', 'Kraftwerk', 'New Order', 'Massive Attack', 'Daft Punk']
    # artist_array.each do |artist_name|
    #   @result = @discogs.search(artist_name, per_page: 10, type: :artist)
    #   next if @result.nil?
    #   @artist_discogs_name = @discogs.get_artist(@result.results.first.id.to_s)
    #   @artist_discogs_members = @discogs.get_artist(@result.results.first.id.to_s).members
    #   @saveband = Band.new(
    #     name: @artist_discogs_name.name,
    #     description: @artist_discogs_name.profile,
    #     category_id: @category_id
    #   )
    #   @saveband.save
    #   artist_ids = []
    #   @artist_discogs_members.each do |artist|
    #     @save_artist = Artist.new(
    #       name: artist.name,
    #       category_id: @category_id
    #     )
    #     @save_artist.save
    #     artist_ids << @save_artist.id
    #   end
    #
    #   artist_ids.each do |artist_id|
    #     @bandmembers = @saveband.bandmembers.build(artist_id: artist_id)
    #     @bandmembers.save
    #   end
    #
    #   @artist = RSpotify::Artist.search(artist_name).first
    #   next if @artist.nil?
    #   @band = Band.find_by(name: @artist_discogs_name.name)
    #   uniq_album_name = @artist.albums.first
    #
    #   @save_album = Album.new(
    #     name: uniq_album_name.name,
    #     release_date: uniq_album_name.release_date,
    #     category_id: @category_id,
    #     band_id: @band.id
    #   )
    #   @save_album.save
    #   @save_album.photos.create(image: URI.parse(uniq_album_name.images[0]['url']))
    #
    #   songs_array = []
    #
    #   uniq_album_name.tracks.each do |song|
    #     @song = Song.new(
    #       name: song.name,
    #       category_id: @category_id
    #     )
    #     @song.save
    #     songs_array << @song
    #   end
    #
    #   songs_array.each do |song|
    #     @tracks = song.tracks.build(album_id: @save_album.id)
    #     @tracks.save
    #   end
    # end
  end
end
