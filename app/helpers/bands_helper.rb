module BandsHelper
  def bands_for_select
    Band.all.collect {|u| ["#{u.name}", u.id]}
  end

  def song_band(obj)
    Band.find(obj.band_id).name unless obj.band_id.nil?
  end

  # def populate
  #   byebug
  #   if params[:name]
  #     @result =  @discogs.search(params[:name], :per_page => 10, :type => :artist)
  #     @artist = @discogs.get_artist(@result.results.first.id.to_s)
  #   end
  # end


end
