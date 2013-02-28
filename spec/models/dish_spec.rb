require 'spec_helper'

describe Dish do
  let(:menu_category) { FactoryGirl.create(:menu_category) }
  before { @dish = menu_category.dishes.build(name: "Omelette", description:"Three Egg Omelet with the seasons best fresh ingredients", price: "9") }

  subject { @dish }

  it { should respond_to(:name) }
  it { should respond_to(:menu_category_id) }
  it { should respond_to(:menu_category) }
  its(:menu_category) { should == menu_category }
  it { should respond_to(:description) }
  it { should respond_to(:price) }

  it { should be_valid }

  describe "when menu_category id is not present" do
    before { @dish.menu_category_id = nil }
    it { should_not be_valid }
  end
end
