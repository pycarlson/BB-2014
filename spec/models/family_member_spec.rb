require 'rails_helper'

describe FamilyMember do 
  describe 'associations' do
    it { should belong_to(:family) }
    # it { should belong_to(:drop_location) }
    it { should have_many(:needs), :dependent => :destroy }
  end

  describe 'validations' do
    it { should validate_presence_of(:first_name) }
    it { should validate_presence_of(:gender) }
    it { should validate_presence_of(:age) }
    it { should validate_presence_of(:bio) }
  end
end