require 'spec_helper'

describe MenuCategory do
  let(:menu) { FactoryGirl.create(:menu) }
  before { @menu_category = menu.menu_categories.build(name: "Omelettes") }

  subject { @menu_category }

  it { should respond_to(:name) }
  it { should respond_to(:menu_id) }
  its(:menu) { should == menu }

  it { should be_valid }

  describe "when menu id is not present" do
    before { @menu_category.menu_id = nil }
    it { should_not be_valid }
  end
end
