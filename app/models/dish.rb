class Dish < ActiveRecord::Base
  attr_accessible :name, :description, :price
  validates :menu_category_id, presence: true

  belongs_to :menu_category
end
