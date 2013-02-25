class AddCoverPhotoToPlaces < ActiveRecord::Migration
  def change
    add_column :places, :coverphoto, :string
  end
end
