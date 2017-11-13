class RemoveDestroyFromFriendships < ActiveRecord::Migration[5.1]
  def change
    remove_column :friendships, :destroy, :string
  end
end
