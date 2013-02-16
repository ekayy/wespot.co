class Place < ActiveRecord::Base
  attr_accessible :name, :instagram_tag
  validates :user_id, presence: true

  belongs_to :user
end
