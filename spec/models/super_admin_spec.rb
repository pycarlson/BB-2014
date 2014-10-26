require 'rails_helper'

describe SuperAdmin do 
  describe 'associations' do
    it { should belong_to(:drive) }
  end

  describe 'validations' do
    it { should validate_presence_of(:email) }
  end
end