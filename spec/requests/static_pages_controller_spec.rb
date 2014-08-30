require 'spec_helper'

describe "#faq" do
  it "renders successfully" do
    get :faq
    response.should be_success
    response.should render_template('static_pages/faq')
      # response.body.should have_css('.company-pages')
  end

# describe "Static pages" do

#   subject { page }

#   describe "Faq page" do
#     before { visit faq_path }

#     it { should have_content('Adopt-a-Family FAQs') }
#     it { should have_title(full_title('FAQs')) }
#   end

#   describe "Shopping Tips page" do
#     before { visit shopping_tips_path }

#     it { should have_content('Shopping Tips') }
#     it { should have_title(full_title('Shopping Tips')) }
#   end

end