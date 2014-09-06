require 'rails_helper'

RSpec.describe "adoptions/edit", :type => :view do
  before(:each) do
    @adoption = assign(:adoption, Adoption.create!(
      :drive_id => 1,
      :user_id => 1,
      :family_id => 1,
      :full_name => "MyString",
      :street => "MyString",
      :city => "MyString",
      :state => "MyString",
      :zip => "MyString",
      :phone => "MyString",
      :company => "MyString",
      :drop_location_id => 1,
      :drop_date_id => 1
    ))
  end

  it "renders the edit adoption form" do
    render

    assert_select "form[action=?][method=?]", adoption_path(@adoption), "post" do

      assert_select "input#adoption_drive_id[name=?]", "adoption[drive_id]"

      assert_select "input#adoption_user_id[name=?]", "adoption[user_id]"

      assert_select "input#adoption_family_id[name=?]", "adoption[family_id]"

      assert_select "input#adoption_full_name[name=?]", "adoption[full_name]"

      assert_select "input#adoption_street[name=?]", "adoption[street]"

      assert_select "input#adoption_city[name=?]", "adoption[city]"

      assert_select "input#adoption_state[name=?]", "adoption[state]"

      assert_select "input#adoption_zip[name=?]", "adoption[zip]"

      assert_select "input#adoption_phone[name=?]", "adoption[phone]"

      assert_select "input#adoption_company[name=?]", "adoption[company]"

      assert_select "input#adoption_drop_location_id[name=?]", "adoption[drop_location_id]"

      assert_select "input#adoption_drop_date_id[name=?]", "adoption[drop_date_id]"
    end
  end
end
