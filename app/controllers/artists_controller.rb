class ArtistsController < ApplicationController
before_action do
    @discogs = Discogs::Wrapper.new("Test OAuth", user_token: 'uUAcpNNqtCmvrLITnpzKeuxfUcxsQdeGRJRggXqq')
  end


 def show
  @artist = Artist.find(params[:id])
  @result =  @discogs.search(@artist.name.to_s, :per_page => 10, :type => :artist)
  @artist_discogs = @discogs.get_artist(@result.results.first.id.to_s)

 end
end
