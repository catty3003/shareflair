class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :title
      t.string :category_id
      t.string :target_group
      t.string :size
      t.string :color
      t.string :price
      t.string :duration
      t.text :description
      t.integer :user_id

      t.timestamps
    end
  end
end
