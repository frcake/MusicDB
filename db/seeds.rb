# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

#
# album = Album.create([
#   {name:    'Welcome to the Sky Valley'    }    ,    {    release_date:    '11/12/1999'    },
#   {name:    'Spine of God'    }    ,    {    release_date:    '11/12/1999'    },
#   {name:    'Jalamanta'    }    ,    {    release_date:    '11/12/1999'    },
#   {name:    'Busse Woods'    }    ,    {    release_date:    '11/12/1999'    },
#   {name:    'White Album'    }    ,    {    release_date:    '11/12/1999'    },
#   {name:    'Aftermath'    }    ,    {    release_date:    '11/12/1999'    }
# ])
#
#
# artist = Artist.create([{name:    'Brant'    ,    country:    'USA',description:    'Stoner Drummer of legendary band Kyuss'    },
#   {name:    'John'        ,            country:    'USA'    ,    description:    'desc'    },
#   {name:    'Josh'        ,            country:    'USA'    ,    description:    'desc'    },
#   {name:    'Chris'        ,              country:    'USA'    ,    description:    'desc'    },
#   {name:    'Joe'        ,             country:    'USA'    ,    description:    'desc'    },
#   {name:    'Jon'        ,             country:    'USA'    ,    description:    'desc'    },
#   {name:    'Michael'        ,              country:    'USA'    ,    description:    'desc'    }
# ])
#
#
# bands = Band.create([{name:    'Kyuss'        ,        description:    'Stoner Band'    },
#   {name:    'Monster Magnet'        ,        description:    'Psychedelic Rock Band'    },
#   {name:    'Acid King'        ,        description:    'Doom Stoner Band'    }
# ])
# require 'faker'
#
# 5000.times do
#   user = User.new
#   user.username = Faker::Name.first_name
#   user.email = Faker::Internet.safe_email(user.username)
#   user.password = '123123'
#   user.password_confirmation = '123123'
#   user.save!
# end

# User.all.each { |u| u.user_vector.dimensions = UserVector.new unless u.user_vector }

# this produces a hash with an array of ids for each category
# category_hash = {}
# Category.all.each { |cat| category_hash[cat.name.downcase.to_sym] = cat.albums.map(&:id) unless cat.albums.empty? }

#--RESULTING HASH--#
# category_hash = {:metal=>[16, 17, 18, 19, 20],
#                  :country=>[36, 37, 38, 39, 40],
#                  :jazz=>[11, 12, 13, 14, 15],
#                  :reggae=>[51, 52, 53],
#                  :blues=>[26, 27, 28, 29, 30],
#                  :pop=>[46, 47, 48, 49, 50],
#                  :instrumental=>[71, 72, 73, 74],
#                  :electronica=>[75, 76, 77, 78, 79],
#                  :punk=>[31, 32, 33, 34, 35],
#                  :indie=>[54, 55, 56, 57],
#                  :alternative=>[58, 59, 60, 61],
#                  :rock=>[21, 22, 23, 24, 25],
#                  :hip_hop=>[41, 42, 43, 44, 45],
#                  :dance=>[66, 67, 68, 69, 70],
#                  :rnb=>[62, 63, 64, 65]}

# up = UserProfiler.new

# album_ids-> [1,5,6,7,32].sample(up.rock_profile[:rock].to_a.sample(1).first)

# rock_users = User.all.where('id >= 207 AND id <= 455').map(&:id)
#
# rock_users.each do |u|
#   UserProfiler.new.rock_profile.each do |album|
#     record = RecordLibrary.new(user_id: u, album_id: album)
#     record.save
#   end
# end

# hip_hop_users = User.all.where('id >= 456 AND id <= 630').map(&:id)
#
# hip_hop_users.each do |u|
#   UserProfiler.new.hip_hop_profile.each do |album|
#     record = RecordLibrary.new(user_id: u, album_id: album)
#     record.save
#   end
# end
#
# pop_users = User.all.where('id >= 631 AND id <= 782').map(&:id)
#
# pop_users.each do |u|
#   UserProfiler.new.pop_profile.each do |album|
#     record = RecordLibrary.new(user_id: u, album_id: album)
#     record.save
#   end
# end
#
# country_users = User.all.where('id >= 781 AND id <= 861').map(&:id)
#
# country_users.each do |u|
#   UserProfiler.new.country_profile.each do |album|
#     record = RecordLibrary.new(user_id: u, album_id: album)
#     record.save
#   end
# end
#
# indie_users = User.all.where('id >= 860 AND id <= 925').map(&:id)
#
# indie_users.each do |u|
#   UserProfiler.new.indie_profile.each do |album|
#     record = RecordLibrary.new(user_id: u, album_id: album)
#     record.save
#   end
# end
#
# punk_users = User.all.where('id >= 926 AND id <= 965').map(&:id)
#
# punk_users.each do |u|
#   UserProfiler.new.punk_profile.each do |album|
#     record = RecordLibrary.new(user_id: u, album_id: album)
#     record.save
#   end
# end
#
# dance_users = User.all.where('id >= 966 AND id <= 997').map(&:id)
#
# dance_users.each do |u|
#   UserProfiler.new.dance_profile.each do |album|
#     record = RecordLibrary.new(user_id: u, album_id: album)
#     record.save
#   end
# end
#
# jazz_users = User.all.where('id >= 998 AND id <= 1000').map(&:id)
#
# jazz_users.each do |u|
#   UserProfiler.new.jazz_profile.each do |album|
#     record = RecordLibrary.new(user_id: u, album_id: album)
#     record.save
#   end
# end

# ##########USer vector##################3

# category_sum_hash = {}
# Category.all.each { |c| category_sum_hash[c.name.downcase.to_sym] = 0 if c.parent_id.nil? }
#
# User.first.albums.map { |a| category_sum_hash[a.category.name.downcase.to_sym] += 1 }
#
# category_sum_hash.each { |k, v| u.user_vector.send("#{k}=", v) }
#--------------------------------------------------------------------------------------------------
# User.all.each do |u|
#   category_sum_hash = {}
#
#   Category.all.each { |c| category_sum_hash[c.name.downcase.to_sym] = 0 if c.parent_id.nil? }
#
#   u.albums.each { |a| category_sum_hash[a.category.name.downcase.to_sym] += 1 }
#
#   category_sum_hash.each { |k, v| u.user_vector.send("#{k}=", v) }
#
#   u.user_vector.save
# end
#
#
# ###########FRIENDSHIPS ###################3333
s = Time.now
User.all.each do |user|
  user_recommendations = user.music_recommendation.recommendation
  befollow = []
  next if user_recommendations.blank?
  befollow = user_recommendations.sample(user_recommendations.length / 2)
  befollow.each do |bf|
    @friendship = user.friendships.build(friend_id: bf)
    @friendship.save
  end
end
e = Time.now
puts e - s
