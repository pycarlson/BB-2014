# Read about factories at https://github.com/thoughtbot/factory_girl
require 'rails_helper'

FactoryGirl.define do
  factory :adoption do
    drive_id 1
    user_id 1
    family_id 1
    full_name "MyString"
    street "MyString"
    city "MyString"
    state "MyString"
    zip "MyString"
    phone "MyString"
    company "MyString"
    drop_location_id 1
    drop_date_id 1
  end
end
