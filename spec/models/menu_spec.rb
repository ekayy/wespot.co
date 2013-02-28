require 'spec_helper'

describe Menu do

  let(:place) { FactoryGirl.create(:place) }
  before { @menu = place.menus.build(name: 'Brunch') }

  subject { @menu }

  it { should respond_to(:name) }
  it { should respond_to(:place_id) }
  it { should respond_to(:place) }
  its(:place) { should == place }

  it { should be_valid }

  describe "when place id is not present" do
    before { @menu.place_id = nil }
    it { should_not be_valid }
  end
end
