class AddMembersToFamilies < ActiveRecord::Migration
  def change
    add_column :families, :members, :integer
  end
end
