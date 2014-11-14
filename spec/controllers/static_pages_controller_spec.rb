require 'rails_helper'

describe "Static pages" do

  subject { page }

   before do
      @drive = FactoryGirl.create(:drive)
      @organization = FactoryGirl.create(:organization)
    end

  describe "Faq page" do
    before { visit faq_path }

    it { should have_content('What is the Adopt-A-Family program?') }
    it { should have_selector('.faqs') }
    it { should have_title(full_title('Frequently Asked Questions')) }
  end

  describe "Shopping Tips page" do
    before { visit shopping_tips_path }

    it { should have_content('FOOD (optional)') }
    it { should have_selector('.shopping-tips') }
    it { should have_title(full_title('Shopping Tips')) }
  end
  
  describe "Home page" do
    before { visit root_path }

    it { should have_content('Adopt-a-Family Holiday Gift Giving Program') }
    it { should have_selector('.home-title') }
    it { should have_title(full_title('')) }
  end
end