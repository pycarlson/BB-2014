require 'rails_helper'

describe Adoption do 
  describe 'associations' do
    it { should belong_to(:user) }
    it { should belong_to(:family) }
    it { should belong_to(:drive) }
    it { should have_one(:drop_location) }
    it { should have_one(:drop_date) }
  end

  describe 'validations' do
    it { should validate_presence_of(:drive_id) }
    it { should validate_presence_of(:user_id) }
    it { should validate_presence_of(:first_name) }
    it { should validate_presence_of(:last_name) }
    it { should validate_presence_of(:email) }
    it { should validate_presence_of(:street) }
    it { should validate_presence_of(:city) }
    it { should validate_presence_of(:state) }
    it { should validate_presence_of(:zip) }
    it { should validate_presence_of(:phone) }
  end
end