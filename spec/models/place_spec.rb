require 'spec_helper'

describe Place do

  let(:user) { FactoryGirl.create(:user) }
  before { @place = user.build_place(name: "Restaurant") }

  subject { @place }

  it { should respond_to(:name) }
  it { should respond_to(:user_id) }
  it { should respond_to(:user) }
  its(:user) { should == user }
  it { should respond_to(:instagram_tag) }
  it { should respond_to(:coverphoto) }
  it { should respond_to(:remote_coverphoto_url) }

  it { should be_valid }

  describe "when user id is not present" do
    before { @place.user_id = nil }
    it { should_not be_valid }
  end

  describe "accessible attributes" do
    it "should not allow access to user_id" do
      expect do
        Place.new(user_id: user.id)
      end.to raise_error(ActiveModel::MassAssignmentSecurity::Error)
    end
  end
end
