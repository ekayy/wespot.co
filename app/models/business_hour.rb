class BusinessHour < ActiveRecord::Base
  attr_accessible :day, :open_time, :close_time
  validates :place_id, presence: true

  belongs_to :place
end
