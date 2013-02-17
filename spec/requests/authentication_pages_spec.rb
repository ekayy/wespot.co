require 'spec_helper'

describe "Authentication" do

  subject { page }

  describe "login page" do
    before { visit user_session_path }

    it { should have_selector('h2', text: 'Login') }
  end

  describe "login" do
    before { visit user_session_path }

    describe "with invalid information" do
      before { click_button 'Login' }

      it { should have_selector('h2', text: 'Login') }
    end

    describe "with valid information" do
      let(:user) { FactoryGirl.create(:user) }
      before { login user }

      it { should have_link('Customize Page', href: edit_place_path(user)) }
      it { should have_link('Settings', href: edit_user_registration_path) }
      it { should have_link('Logout', href: destroy_user_session_path) }
      it { should_not have_link('Login', href: user_session_path) }

      context "followed by signout" do
        before { click_link "Logout" }
        it { should have_link('Login') }
      end
    end
  end

  describe "authorization" do

    describe "for non-signed-in users" do
      let(:user) { FactoryGirl.create(:user) }

      describe "when attempting to visit a protected page" do
        before do
          visit edit_user_registration_path
          fill_in "Email",    with: user.email
          fill_in "Password", with: user.password
          click_button "Login"
        end

        describe "after signing in" do

          it "should render the desired protected page" do
            page.should have_selector('h2', text: 'Edit User')
          end
        end
      end
    end

    describe "as wrong user" do
      let(:user) { FactoryGirl.create(:user) }
      let(:wrong_user) { FactoryGirl.create(:user, email: "wrong@example.com") }
      before { login user }

      context "visiting Users#edit page" do
        before { visit edit_user_registration_path(wrong_user) }
        it { should_not have_selector('h2', text: 'Edit user') }
      end

      # context "submitting a PUT request to the Users#update action" do
      #   before { put edit_user_registration_path(wrong_user) }
      #   specify { response.should redirect_to(root_path) }
      # end
    end
  end
end
