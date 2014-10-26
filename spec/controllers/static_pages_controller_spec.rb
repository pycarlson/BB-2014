require 'rails_helper'

describe "Static pages" do

  subject { page }

  describe "Faq page" do
    before { visit faq_path }

    it { should have_content('Frequently Asked Questions') }
    it { should have_title(full_title('Frequently Asked Questions')) }
  end

  describe "Shopping Tips page" do
    before { visit shopping_tips_path }

    it { should have_content('Shopping Tips') }
    it { should have_title(full_title('Shopping Tips')) }
  end
  
end