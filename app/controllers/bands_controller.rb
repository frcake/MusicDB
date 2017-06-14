class BandsController < ApplicationController

  before_action do
    @discogs = Discogs::Wrapper.new("Test OAuth", user_token: 'uUAcpNNqtCmvrLITnpzKeuxfUcxsQdeGRJRggXqq')
  end


  def show
    @band = Band.find(params[:id])
    @result =  @discogs.search(@band.name.to_s, :per_page => 10, :type => :artist)
    @band_discogs = @discogs.get_artist(@result.results.first.id.to_s)

  end
end
