class RemoveCreateFromFriendships < ActiveRecord::Migration[5.1]
  def change
    remove_column :friendships, :create, :string
  end
end
