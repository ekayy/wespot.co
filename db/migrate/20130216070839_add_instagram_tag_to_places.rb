class AddInstagramTagToPlaces < ActiveRecord::Migration
  def change
    add_column :places, :instagram_tag, :string
  end
end
