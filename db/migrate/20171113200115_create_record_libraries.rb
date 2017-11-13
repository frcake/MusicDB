class CreateRecordLibraries < ActiveRecord::Migration[5.1]
  def change
    create_table :record_libraries do |t|
      t.references :user, foreign_key: true
      t.references :album, foreign_key: true

      t.timestamps
    end
  end
end
