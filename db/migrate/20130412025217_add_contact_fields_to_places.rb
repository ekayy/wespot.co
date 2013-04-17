class AddContactFieldsToPlaces < ActiveRecord::Migration
  def change
    change_table :places do |t|
      t.string :address
      t.string :phone
    end
  end
end
