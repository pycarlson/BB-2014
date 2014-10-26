require 'rails_helper'

describe Organization do 
  describe 'validations' do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:blurb) }
    it { should validate_presence_of(:email) }
    it { should validate_presence_of(:phone) }
    it { should validate_presence_of(:address) }
    it { should validate_presence_of(:zip) }
    it { should validate_presence_of(:website_url) }
    it { should validate_uniqueness_of(:email) }
    it { should validate_uniqueness_of(:phone) }
    it { should validate_uniqueness_of(:address) }
  end
end