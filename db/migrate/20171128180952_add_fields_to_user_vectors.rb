class AddFieldsToUserVectors < ActiveRecord::Migration[5.1]
  def change
    add_column :user_vectors, :metal, :integer, default: 0
    add_column :user_vectors, :country, :integer, default: 0
    add_column :user_vectors, :classical, :integer, default: 0
    add_column :user_vectors, :jazz, :integer, default: 0
    add_column :user_vectors, :reggae, :integer, default: 0
    add_column :user_vectors, :blues, :integer, default: 0
    add_column :user_vectors, :pop, :integer, default: 0
    add_column :user_vectors, :instrumental, :integer, default: 0
    add_column :user_vectors, :vocal, :integer, default: 0
    add_column :user_vectors, :electronica, :integer, default: 0
    add_column :user_vectors, :techno, :integer, default: 0
    add_column :user_vectors, :punk, :integer, default: 0
    add_column :user_vectors, :drum_n_bass, :integer, default: 0
    add_column :user_vectors, :indie, :integer, default: 0
    add_column :user_vectors, :alternative, :integer, default: 0
    add_column :user_vectors, :dubstep, :integer, default: 0
    add_column :user_vectors, :rock, :integer, default: 0
    add_column :user_vectors, :hip_hop, :integer, default: 0
    add_column :user_vectors, :dance, :integer, default: 0
    add_column :user_vectors, :rnb, :integer, default: 0
  end
end
