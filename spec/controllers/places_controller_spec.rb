include Devise::TestHelpers

describe PlacesController do

  before { @place = FactoryGirl.create(:place) }

  # describe "GET places#index" do
  #   it "populates an array of contacts"
  #   it "renders the :index view"
  # end

  describe "GET places#show" do
    it "assigns the requested place to @place" do
      get :show, id: @place
      assigns(:place).should eq(@place)
    end
    it "renders the :show template" do
      get :show, id: @place
      response.should render_template :show
    end
  end

  # describe "PUT update" do
  #   context "valid attributes" do
  #     it "located the requested @place" do
  #       put :update, id: @place, place: FactoryGirl.attributes_for(:place)
  #       assigns(:place).should eq(@place)
  #     end

  #     it "changes @place's attributes" do
  #       put :update, id: @place,
  #         place: FactoryGirl.attributes_for(:place, name: @place.name, instagram_tag: @place.instagram_tag)
  #       @place.reload
  #       @place.name.should eq(@place.name)
  #       @place.instagram_tag.should eq(@place.instagram_tag)
  #     end

  #     it "redirects to the updated place" do
  #       put :update, id: @place, place: FactoryGirl.attributes_for(:place)
  #       #response?
  #     end
  #   end
  # end
end