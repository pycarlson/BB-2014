require 'rails_helper'

describe DropLocation do 
  describe 'associations' do
    it { should belong_to(:drive) }
    # it { should belong_to(:adoption) }
    it { should have_many(:families) }
    it { should have_many(:users) }
    it { should have_many(:drop_dates) }
  end

  describe 'validations' do
    it { should validate_presence_of(:drive_id) }
    it { should validate_presence_of(:street) }
    it { should validate_presence_of(:city) }
    it { should validate_presence_of(:state) }
    it { should validate_presence_of(:zipcode) }
    it { should validate_presence_of(:drop_location_name) }
  end
end