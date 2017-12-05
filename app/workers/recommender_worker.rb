require 'sidekiq-scheduler'
require 'active_support'
class RecommenderWorker
  include Sidekiq::Worker
  def perform
    @users = User.all.order('id ASC').includes(:user_vector, :music_recommendation)
    @categories = Category.all
    find_library_changes
    # users_all_array = [][]

    # @distance = Matrix.build(@users.length)
    @all_distance = []
    @recommended_users = []
    @first_row = []
    @first_row << [nil]
    @first_row << @users.map(&:id)
    @all_distance << @first_row.flatten
    @users.each do |user1|
      distance = []
      distance << user1.id
      @users.each do |user2|
        distance << euclidean_distance(user1.user_vector.categories, user2.user_vector.categories)
      end
      @all_distance << distance.to_a
    end
    users_recommendations @all_distance
  end

  def find_library_changes
    @users.each do |u|
      category_sum_hash = {}
      @categories.each { |c| category_sum_hash[c.name.downcase.to_sym] = 0 if c.parent_id.nil? }
      u.albums.each { |a| category_sum_hash[a.category.name.downcase.to_sym] += 1 }
      category_sum_hash.each { |k, v| u.user_vector.send("#{k}=", v) }
      u.user_vector.save
    end
  end

  def euclidean_distance(p1, p2)
    sum_of_squares = 0
    p1.each_with_index do |p1_coord, index|
      sum_of_squares += (p1_coord - p2[index])**2
    end
    Math.sqrt(sum_of_squares)
  end

  # def recommend_me(distance_array)
  #   recommended_users = []
  #   distance_array[current_user.id].each_with_index do |v,i|
  #  recommended_users << i unless v > 7 && v == 0.0
  # end
  #   r = User.where(id: recommended_users)
  # end

  def users_recommendations(distance_array)
    Parallel.each(@users, in_threads: 8) do |user|
      recommended_users = []
      for z in 1..distance_array.size - 1 do
        user_index = z unless distance_array[z].first != user.id
      end

      distance_array[user_index].each_with_index do |v, i|
        recommended_users << @first_row[1][i] unless v > 4.2 || v == 0.0 || i == 1
      end
      ActiveRecord::Base.connection_pool.with_connection do
        user.music_recommendation.update_attribute(:recommendation, recommended_users)
      end
    end
  end
end
