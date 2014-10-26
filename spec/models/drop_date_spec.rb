require 'rails_helper'

describe DropDate do 
  describe 'associations' do
    it { should belong_to(:drop_location) }
    it { should have_one(:adoption) }
  end

  describe 'validations' do
    it { should validate_presence_of(:date) }
    it { should validate_presence_of(:start_time) }
    it { should validate_presence_of(:end_time) }
    it { should validate_presence_of(:drop_location_id) }
  end
end