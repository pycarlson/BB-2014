require 'rails_helper'

describe Family do 
  describe 'associations' do
    it { should belong_to(:drive) }
    it { should have_one(:donor) }
    it { should have_one(:adoption) }
    it { should have_many(:family_members), :dependent => :destroy }
  end

  describe 'validations' do
    it { should validate_presence_of(:code) }
    it { should validate_uniqueness_of(:code) }
  end
end