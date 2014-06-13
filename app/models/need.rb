class Need < ActiveRecord::Base
  belongs_to :family_member, :inverse_of => :needs
end
