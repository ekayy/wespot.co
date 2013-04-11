class Place < ActiveRecord::Base
  attr_accessible :name, :instagram_tag, :coverphoto, :remote_coverphoto_url, :coverphoto_cache, :subdomain, :menus_attributes, :business_hours_attributes
  validates :user_id, presence: true
  # validates_uniqueness_of :subdomain

  belongs_to :user
  has_many :menus
  has_many :business_hours
  accepts_nested_attributes_for :menus, allow_destroy: true
  accepts_nested_attributes_for :business_hours, allow_destroy: true
  mount_uploader :coverphoto, CoverphotoUploader

  before_create :build_hours

  private
  def build_hours
    (0..6).each do |index|
      self.business_hours.build(:day => index)
    end
    true
  end
end