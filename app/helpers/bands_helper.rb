module BandsHelper
  def bands_for_select
    Band.all.collect { |u| [u.name.to_s, u.id] }
  end
end
