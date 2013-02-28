class CreateDishes < ActiveRecord::Migration
  def change
    create_table :dishes do |t|
      t.integer :menu_category_id
      t.string :name
      t.text :description
      t.integer :price

      t.timestamps
    end
  end
end
