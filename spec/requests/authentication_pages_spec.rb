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
      before do
        fill_in "Email", with: user.email
        fill_in "Password", with: user.password
        click_button 'Login'
      end

      it { should have_link('Settings', href: edit_user_registration_path) }
      it { should have_link('Logout', href: destroy_user_session_path) }
      it { should_not have_link('Login', href: user_session_path) }

      describe "followed by signout" do
        before { click_link "Logout" }
        it { should have_link('Login') }
      end
    end
  end
end
