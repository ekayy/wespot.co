class Dish < ActiveRecord::Base
  attr_accessible :name, :description, :price_in_dollars
  validates :menu_category_id, presence: true

  belongs_to :menu_category

  def price_in_dollars
    price.to_d / 100 if price
  end

  def price_in_dollars=(dollars)
    self.price = dollars.to_d * 100 if dollars.present?
  end
end
