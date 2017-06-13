class DiscogsController < ApplicationController
  before_action do
    @discogs = Discogs::Wrapper.new("Test OAuth", user_token: 'uUAcpNNqtCmvrLITnpzKeuxfUcxsQdeGRJRggXqq')
  end

  def index
    @array = []
    @result =  @discogs.search('Metallica', :per_page => 10, :type => :artist)
    @artist = @discogs.get_artist(@result.results.first.id.to_s)
    @releas = @discogs.get_artist_releases(@result.results.first.id.to_s)
    @releases = @releas.first
    # @releases.releases.each do |r|
    #   @array << @discogs.get_release(r.id.to_s)
    # end
  end

  # def authenticate
  #   app_key      = 'VKhSTBWEtNOXyvdaXaDN'#ENV["VKhSTBWEtNOXyvdaXaDN"]
  #   app_secret   = 'TApZytIPHnyZkrWuOzZzVGtpvsnajWLl'#ENV["TApZytIPHnyZkrWuOzZzVGtpvsnajWLl"]
  #   request_data = @discogs.get_request_token(app_key, app_secret,
  #   "http://127.0.0.1:3000/discogs/callback")
  #
  #   session[:request_token] = request_data[:request_token]
  #
  #   redirect_to request_data[:authorize_url]
  # end
  #
  # def callback
  #   @discogs = Discogs::Wrapper.new("Test OAuth")
  #   request_token = session[:request_token]
  #   verifier      = params[:oauth_verifier]
  #   access_token  = @discogs.authenticate(request_token, verifier)
  #
  #   session[:request_token] = nil
  #   session[:access_token]  = access_token
  #
  #   @discogs.access_token = access_token
  #
  #
  #   redirect_to root_path
  # end

  def show
    image = @discogs.get_image(params[:id])

    send_data(image,
      :disposition => "inline",
    :type => "image/jpeg")
  end

  def whoami
    @user = @discogs.get_identity
  end

  def add_want
    release_id = "2489281"

    @user     = @discogs.get_identity
    @response = @discogs.add_release_to_user_wantlist(@user.username, release_id)
  end

  def edit_want
    release_id = "2489281"
    notes      = "Added via the Discogs Ruby Gem. But, you *DO* want it now!!"
    rating     = 5

    @user     = @discogs.get_identity
    @response = @discogs.edit_release_in_user_wantlist(@user.username,
      release_id,
    {:notes => notes, :rating => rating})
  end

  def remove_want
    release_id = "2489281"

    @user     = @discogs.get_identity
    @response = @discogs.delete_release_from_user_wantlist(@user.username, release_id)
  end

end
