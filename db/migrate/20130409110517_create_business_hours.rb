class CreateBusinessHours < ActiveRecord::Migration
  def change
    create_table :business_hours do |t|
      t.integer :place_id
      t.integer :day
      t.time :open_time
      t.time :close_time
    end
  end
end
