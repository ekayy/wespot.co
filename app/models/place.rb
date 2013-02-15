class Place < ActiveRecord::Base
  attr_accessible :name
  validates :user_id, presence: true

  belongs_to :user
end
