class Need < ActiveRecord::Base
  belongs_to :family_member

  validates :item, :family_member_id, presence: :true
end
