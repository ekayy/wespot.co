require 'spec_helper'

describe "Place pages" do
  subject { page }

  let(:user) { FactoryGirl.create(:user) }
  before { login user }

  describe "customize form" do
    before { visit edit_place_path(user.place.id) }

    it { should have_selector('h2', 'Customize)') }
    it { should have_field('place_name') }
    it { should have_field('place_instagram_tag') }

    describe "with valid information" do
      before do
        fill_in "Instagram tag", with: "localmissioneatery"
      end

      context "after submission" do
        before { click_button 'Customize' }

        it "should render user's place" do
          current_path.should == place_path(user.place.id)
        end
      end
    end
  end
end
