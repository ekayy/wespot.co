class MenuCategory < ActiveRecord::Base
  attr_accessible :name, :dishes_attributes
  validates :menu_id, presence: true

  belongs_to :menu
  has_many :dishes
  accepts_nested_attributes_for :dishes, allow_destroy: true
end
