require 'sidekiq-scheduler'
require 'active_support'
class RecommenderWorker
  include Sidekiq::Worker
  def perform
    find_library_changes
    # users_all_array = [][]
    @users = User.all.order('id ASC').includes(:user_vector, :music_recommendation)
    # @distance = Matrix.build(@users.length)
    @all_distance = []
    @recommended_users = []
    first_row = []
    first_row << [nil]
    first_row << @users.map(&:id)
    @all_distance << first_row.flatten
    @users.each do |user1|
      distance = []
      distance << user1.id
      @users.each do |user2|
        distance << euclidean_distance(user1.user_vector.categories, user2.user_vector.categories)
      end
      @all_distance << distance.to_a
    end
    # byebug
    users_recommendations @all_distance
  end

  def find_library_changes
    User.all.each do |u|
      category_sum_hash = {}

      Category.all.each { |c| category_sum_hash[c.name.downcase.to_sym] = 0 if c.parent_id.nil? }

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

  def recommend_me(distance_array)
    recommended_users = []
    distance_array[current_user.id].each_with_index { |v, i| recommended_users << i unless v > 7 && v == 0.0 }
    r = User.where(id: recommended_users)
  end

  def users_recommendations(distance_array)
    @users.each do |user|
      recommended_users = []
      distance_array[user.id].each_with_index { |v, i| recommended_users << i unless v > 7 || v == 0.0 }
      # r = ApplicationRecord::User.where(id: recommended_users)
      # byebug
      user.music_recommendation.recommendation = recommended_users
      # byebug
      user.music_recommendation.save
    end
  end
end
