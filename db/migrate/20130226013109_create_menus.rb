class CreateMenus < ActiveRecord::Migration
  def change
    create_table :menus do |t|
      t.integer :place_id

      t.string :name
      t.timestamps
    end
  end
end
