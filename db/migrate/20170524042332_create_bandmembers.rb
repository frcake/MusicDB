class CreateBandmembers < ActiveRecord::Migration[5.1]
  def change
    create_table :bandmembers do |t|
      t.belongs_to :band,index: true
      t.belongs_to :artist , index: true
      t.timestamps
    end
  end
end
