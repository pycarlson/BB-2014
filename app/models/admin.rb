class Admin < ActiveRecord::Base
  belongs_to :drive

  validates :email, presence: :true
end
