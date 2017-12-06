# class RecommendationsController < ApplicationController
#   def index
#     @recommended_users = User.where(id: current_user.music_recommendation.recommendation).order('id ASC')
#   end
# end
require 'matrix'
class RecommendationsController < ApplicationController
  def index
    @users = User.all.order('id ASC').includes(:friendships)

    scan_for_new_friendships

    @all_connections = []
    @first_row = []
    @first_row << ['e']
    @first_row << @users.map(&:id)
    # @all_connections << @first_row.flatten
    s = Time.now
    @users.each do |user1|
      connection = []
      # connection << user1.id
      @users.each do |user2|
        connection << are_connected(user1, user2)
      end
      @all_connections << connection.to_a
    end
    e = Time.now
    puts "BEFORE MATRIX #{e - s}"
    s = Time.now

    mother_graph = Matrix[*@all_connections]
    mother_graph_e2 = mother_graph**2
    mother_graph_e3 = mother_graph_e2 * mother_graph

    mother_array = convert_to_array_with_indices(mother_graph)
    mother_array_e2 = convert_to_array_with_indices(mother_graph_e2)
    mother_array_e3 = convert_to_array_with_indices(mother_graph_e3)

    e = Time.now
    puts "AFTER MATRIX #{e - s}"
    s = Time.now
    # @all_connections = mother_array
    for i in 1..mother_array_e2.length - 1
      for j in 1..mother_array_e2.length - 1
        mother_array_e3[i][j] = 0 if mother_array_e2[i][j] != 0 || i == j
        mother_array_e2[i][j] = 0 if mother_array[i][j] != 0 || i == j
      end
    end
    e = Time.now
    puts "AFTER AFTER MOTHERS TO ARRAY #{e - s}"
    s = Time.now
    users_recommendations(mother_array_e2)
    # binding.pry
    users_recommendations(mother_array_e3)
    e = Time.now
    puts "AFTER RECOMMENDATION #{e - s}"
    @recommended_users = User.where(id: current_user.music_recommendation.recommendation).order('id ASC')
  end

  def convert_to_array_with_indices(matrix)
    # mother_graph_array = []
    # mother_graph_array = matrix.to_a
    mother_graph_array = matrix.to_a.unshift(@first_row.flatten)
    mother_graph_array.each_with_index do |_array, i|
      next if i == 0
      mother_graph_array[i].unshift(@first_row.flatten[i])
    end
    mother_graph_array
  end

  def are_connected(user1, user2)
    user1.friendships.collect(&:friend_id).include?(user2.id) ? 1 : 0
  end

  def scan_for_new_friendships; end

  def users_recommendations(distance_array)
    @users.each do |user|
      recommended_users = []
      for z in 1..distance_array.size - 1 do
        user_index = z unless distance_array[z].first != user.id
      end

      distance_array[user_index].each_with_index do |v, i|
        if i != 0
          recommended_users << @first_row.flatten[i] unless v == 0 || i == 0
        end
      end

      recommended_users = user.music_recommendation.recommendation + recommended_users
      unique_recommended_users = recommended_users.uniq
      # ActiveRecord::Base.connection_pool.with_connection do
      user.music_recommendation.update_attribute(:recommendation, unique_recommended_users)
      # binding.pry
      # end
    end
  end
end
