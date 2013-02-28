class Menu < ActiveRecord::Base
  attr_accessible :name, :menu_categories_attributes
  validates :place_id, presence: true

  belongs_to :place
  has_many :menu_categories
  accepts_nested_attributes_for :menu_categories, allow_destroy: true
end
