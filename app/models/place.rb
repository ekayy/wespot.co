class Place < ActiveRecord::Base
  attr_accessible :name, :instagram_tag, :coverphoto
  validates :user_id, presence: true

  belongs_to :user
  mount_uploader :coverphoto, CoverphotoUploader
end
