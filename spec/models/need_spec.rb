require 'rails_helper'

describe Need do 
  describe 'associations' do
    it { should belong_to(:family_member) }
  end

  describe 'validations' do
    it { should validate_presence_of(:item) }
    it { should validate_presence_of(:family_member_id) }
  end
end