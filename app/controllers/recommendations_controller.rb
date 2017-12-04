class RecommendationsController < ApplicationController
  # def index
  #   # users_all_array = [][]
  #   @users = User.all.order('id ASC').includes(:user_vector)
  #   # @distance = Matrix.build(@users.length)
  #   @all_distance = []
  #   @recommended_users = []
  #   first_row = []
  #   first_row << [nil]
  #   first_row << @users.map(&:id)
  #   @all_distance << first_row.flatten
  #   @users.each do |user1|
  #     distance = []
  #     distance << user1.id
  #     @users.each do |user2|
  #       distance << euclidean_distance(user1.user_vector.categories, user2.user_vector.categories)
  #     end
  #     @all_distance << distance.to_a
  #   end
  #   # byebug
  #   @recommended_users = recommend_me @all_distance
  #   # @recommended_users = current_user.music_recommendation.recommendation
  # end

  def index
    @recommended_users = User.where(id: current_user.music_recommendation.recommendation).order('id ASC')
  end
  #
  # def euclidean_distance(p1, p2)
  #   sum_of_squares = 0
  #   p1.each_with_index do |p1_coord, index|
  #     sum_of_squares += (p1_coord - p2[index])**2
  #   end
  #   Math.sqrt(sum_of_squares)
  # end
  #
  # def recommend_me(distance_array)
  #   recommended_users = []
  #   distance_array[current_user.id].each_with_index { |v, i| recommended_users << i unless v > 7 || v == 0.0 }
  #   r = User.where(id: recommended_users)
  # end
end
