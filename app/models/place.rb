class Place < ActiveRecord::Base
  attr_accessible :name, :instagram_tag, :coverphoto, :remote_coverphoto_url, :coverphoto_cache
  validates :user_id, presence: true

  belongs_to :user
  mount_uploader :coverphoto, CoverphotoUploader
end
