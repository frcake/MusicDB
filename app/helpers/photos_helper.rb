module PhotosHelper
  def photo_create(images = [])
    if !images.nil?
      images.each do |image|
        @album.photos.create(image: image)
      end
    else
      @album.photos.create
    end
  end
end
