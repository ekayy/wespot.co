class Place < ActiveRecord::Base
  attr_accessible :name, :instagram_tag, :coverphoto, :remote_coverphoto_url, :coverphoto_cache, :menus_attributes
  validates :user_id, presence: true

  belongs_to :user
  has_many :menus
  accepts_nested_attributes_for :menus, allow_destroy: true
  mount_uploader :coverphoto, CoverphotoUploader
end
