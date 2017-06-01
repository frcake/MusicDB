module BandsHelper
  def bands_for_select
    Band.all.collect {|u| ["#{u.name}", u.id]}
  end

  def song_band(obj)
    Band.find(obj.band_id).name unless obj.band_id.nil?
  end
end
