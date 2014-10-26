require 'rails_helper'

describe User do 
  describe 'associations' do
    it { should belong_to(:drop_date) }
    it { should belong_to(:drop_location) }
    it { should have_many(:adoptions) }
  end

  describe 'validations' do
    it { should validate_presence_of(:email) }
    it { should validate_presence_of(:password) }
    it { should validate_uniqueness_of(:email) }
  end
end