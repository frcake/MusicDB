class CreateUserVectors < ActiveRecord::Migration[5.1]
  def change
    create_table :user_vectors do |t|
      t.references :user, foreign_key: true
      t.string :dimensions

      t.timestamps
    end
  end
end
