class CreateArtists < ActiveRecord::Migration[5.1]
  def change
    create_table :artists do |t|
      t.string :firstname
      t.string :lastname
      t.string :country
      t.text :description
      t.timestamps
    end
    create_table :categories do |t|
      t.string 'name'
      t.integer 'parent_id'
      t.integer 'lft', null: false
      t.integer 'rgt', null: false
      t.integer 'depth', default: 0, null: false
      t.integer 'children_count', default: 0, null: false
      t.index ['lft'], name: 'index_categories_on_lft'
      t.index ['parent_id'], name: 'index_categories_on_parent_id'
      t.index ['rgt'], name: 'index_categories_on_rgt'
    end
  end
end
