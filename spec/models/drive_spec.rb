require 'rails_helper'

describe Drive do 
  describe 'associations' do
    it { should have_many(:admins).dependent(:destroy) }
    it { should have_many(:super_admins) }
    it { should have_many(:families).dependent(:destroy) }
    it { should have_many(:drop_locations).dependent(:destroy) }
    it { should have_many(:adoptions).dependent(:destroy) }
  end

  describe 'validations' do
    it { should validate_presence_of(:year) }
    it { should validate_presence_of(:blurb) }
    it { should validate_presence_of(:start_date) }
    it { should validate_presence_of(:end_date) }
  end
end