require 'rails_helper'

RSpec.describe "adoptions/index", :type => :view do
  before(:each) do
    assign(:adoptions, [
      Adoption.create!(
        :drive_id => 1,
        :user_id => 2,
        :family_id => 3,
        :full_name => "Full Name",
        :street => "Street",
        :city => "City",
        :state => "State",
        :zip => "Zip",
        :phone => "Phone",
        :company => "Company",
        :drop_location_id => 4,
        :drop_date_id => 5
      ),
      Adoption.create!(
        :drive_id => 1,
        :user_id => 2,
        :family_id => 3,
        :full_name => "Full Name",
        :street => "Street",
        :city => "City",
        :state => "State",
        :zip => "Zip",
        :phone => "Phone",
        :company => "Company",
        :drop_location_id => 4,
        :drop_date_id => 5
      )
    ])
  end

  it "renders a list of adoptions" do
    render
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => 3.to_s, :count => 2
    assert_select "tr>td", :text => "Full Name".to_s, :count => 2
    assert_select "tr>td", :text => "Street".to_s, :count => 2
    assert_select "tr>td", :text => "City".to_s, :count => 2
    assert_select "tr>td", :text => "State".to_s, :count => 2
    assert_select "tr>td", :text => "Zip".to_s, :count => 2
    assert_select "tr>td", :text => "Phone".to_s, :count => 2
    assert_select "tr>td", :text => "Company".to_s, :count => 2
    assert_select "tr>td", :text => 4.to_s, :count => 2
    assert_select "tr>td", :text => 5.to_s, :count => 2
  end
end
