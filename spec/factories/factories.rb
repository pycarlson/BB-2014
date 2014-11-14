require 'rails_helper'

FactoryGirl.define do

  factory :drive do
    year "2014"
    blurb "This is a really cool gift drive"
    start_date "November 30th, 2014"
    end_date "December 25th, 2014"
    status  true
  end

  factory :organization do
    name "Kitty Cat"
    blurb "I like to purrrrrrrrrr"
    email "bright@test.com"
    phone "555-555-5555"
    address "123 test address, San Fran, CA"
    zip "94606"
    website_url "google.com"
  end

  factory :oakland, class: DropLocation do 
    drop_location_name "Oakland"
    street "street"
    city "city"
    state "state"
    zipcode "zip"
    drive
  end

  factory :richmond, class: DropLocation do 
    drop_location_name "Richmond"
    street "street"
    city "city"
    state "state"
    zipcode "zip"
    drive
  end

  factory :antioch, class: DropLocation do 
    drop_location_name "Antioch"
    street "street"
    city "city"
    state "state"
    zipcode "zip"
    drive
  end

  factory :user do
    email "Kitty Cat"
    blurb "I like to purrrrrrrrrr"
    email "bright@test.com"
    phone "555-555-5555"
    address "123 test address, San Fran, CA"
    zip "94606"
    website_url "google.com"
  end

  # factory :adoption do
  #   drive
  #   user
  #   family_id 1
  #   full_name "MyString"
  #   street "MyString"
  #   city "MyString"
  #   state "MyString"
  #   zip "MyString"
  #   phone "MyString"
  #   company "MyString"
  #   drop_location_id 1
  #   drop_date_id 1
  # end
end