class CreateMenuCategories < ActiveRecord::Migration
  def change
    create_table :menu_categories do |t|
      t.integer :menu_id
      t.string :name

      t.timestamps
    end
  end
end