module BandsHelper
  def bands_for_select
    Band.all.collect {|u| ["#{u.name}", u.id]}
  end
end
