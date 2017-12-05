class AlbumsController < ApplicationController
  def index
    # check_AC_import
    # import_user
    # import_artist
    # create_record_library
    @latest_albums = Album.includes(:photos).last(10).reverse
    if params[:term].nil? || params[:term].empty?
      @albums = Album.includes(:photos).all.paginate(page: params[:page] || 1, per_page: 6)
    else
      q = Searchkick.search params[:term], index_name: [Album, Band], model_includes: { Band => [:albums], Album => [:band] }, fields: [:name], match: :word_start
      @bands, @albums = q.results.partition { |r| r.is_a? Band }
      @albums = @bands.map(&:albums).last.to_a - @albums

    end
  end

  def show
    @album = Album.find(params[:id])
    @category_name = Category.find(@album.category_id).name
    @band = Band.includes(:albums, :artists, albums: %i[songs photos]).find(@album.band_id)
    @photo = @band.albums.find { |x| x.id == @album.id }.photos.first.image
    @songs = @band.albums.find { |x| x.id == @album.id }.songs
    @artists = @band.artists
  end

  def check_AC_import
    # @options_voice_collection = scheduled_report_params[:sr_options_voice].map { |collection| Vessel.find_by(did: collection['did']).id }
    # @scheduled_report.scheduled_report_vessels.where(vessel_id: @options_voice_collection).update_all(voice: true)
    #
    # @options_data_collection = scheduled_report_params[:sr_options_data].map { |collection| Vessel.find_by(did: collection['did']).id }
    # @scheduled_report.scheduled_report_vessels.where(vessel_id: @options_data_collection).update_all(data: true)

    users = []
    User.all.each do |x|
      users << x.id
    end
    music_recommendations = MusicRecommendation.all.where(user_id: users)

    music_recommendations.update_all(recommendation: [])
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

  def import_artist
    @discogs = Discogs::Wrapper.new('Test OAuth', user_token: 'uUAcpNNqtCmvrLITnpzKeuxfUcxsQdeGRJRggXqq')

    database_artist = Artist.all.map(&:name)
    database_artist.each do |art|
      @result = @discogs.search(art, per_page: 1, type: :artist)
      @artist = @discogs.get_artist(@result.results.first.id.to_s)

      @save_artist = Artist.find_by_name(art)
      @save_artist.update_attribute(:description, @artist.profile)

      if !@artist.images.nil? && !@artist.images[1].nil?
        @save_artist.photos.create(image: URI.parse(@artist.images[1]['uri']))
      elsif !@artist.images.nil? && !@artist.images[0].nil?
        @save_artist.photos.create(image: URI.parse(@artist.images[0]['uri']))
      end
    end
  end

  def import_user
    id = (1..2000).to_a.shuffle
    794.times do
      user = User.new
      user.user_vector = UserVector.new
      user.music_recommendation = MusicRecommendation.new
      user.username = Faker::Name.first_name
      user.email = "user-#{id.pop}@email-#{id.pop}.com".delete(' ')
      user.password = '123123'
      user.password_confirmation = '123123'
      user.save!
    end
  end

  def create_record_library
    rock_users = User.all.where('id >= 207 AND id <= 455').map(&:id)

    rock_users.each do |u|
      UserProfiler.new.rock_profile.each do |album|
        record = RecordLibrary.new(user_id: u, album_id: album)
        record.save
      end
    end

    hip_hop_users = User.all.where('id >= 456 AND id <= 630').map(&:id)

    hip_hop_users.each do |u|
      UserProfiler.new.hip_hop_profile.each do |album|
        record = RecordLibrary.new(user_id: u, album_id: album)
        record.save
      end
    end

    pop_users = User.all.where('id >= 631 AND id <= 782').map(&:id)

    pop_users.each do |u|
      UserProfiler.new.pop_profile.each do |album|
        record = RecordLibrary.new(user_id: u, album_id: album)
        record.save
      end
    end

    country_users = User.all.where('id >= 781 AND id <= 861').map(&:id)

    country_users.each do |u|
      UserProfiler.new.country_profile.each do |album|
        record = RecordLibrary.new(user_id: u, album_id: album)
        record.save
      end
    end

    indie_users = User.all.where('id >= 860 AND id <= 925').map(&:id)

    indie_users.each do |u|
      UserProfiler.new.indie_profile.each do |album|
        record = RecordLibrary.new(user_id: u, album_id: album)
        record.save
      end
    end

    punk_users = User.all.where('id >= 926 AND id <= 965').map(&:id)

    punk_users.each do |u|
      UserProfiler.new.punk_profile.each do |album|
        record = RecordLibrary.new(user_id: u, album_id: album)
        record.save
      end
    end

    dance_users = User.all.where('id >= 966 AND id <= 997').map(&:id)

    dance_users.each do |u|
      UserProfiler.new.dance_profile.each do |album|
        record = RecordLibrary.new(user_id: u, album_id: album)
        record.save
      end
    end

    jazz_users = User.all.where('id >= 998 AND id <= 1000').map(&:id)

    jazz_users.each do |u|
      UserProfiler.new.jazz_profile.each do |album|
        record = RecordLibrary.new(user_id: u, album_id: album)
        record.save
      end
    end
  end
end
