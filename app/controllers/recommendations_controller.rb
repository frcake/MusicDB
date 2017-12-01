class RecommendationsController < ApplicationController
  def index
    # users_all_array = [][]
    @users = User.all.includes(:user_vector)
    @distance = Array.new(1) { [] }
    @users.each_with_index do |user1, index1|
      @users.each_with_index do |user2, index2|
        @distance[index1, index2] = euclidean_distance(user1.user_vector.categories, user2.user_vector.categories)
      end
    end
    byebug
  end

  def euclidean_distance(p1, p2)
    sum_of_squares = 0
    p1.each_with_index do |p1_coord, index|
      sum_of_squares += (p1_coord - p2[index])**2
    end
    Math.sqrt(sum_of_squares)
end
end
