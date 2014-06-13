class CreateNeeds < ActiveRecord::Migration
  def change
    create_table :needs do |t|
      t.text  :item
      t.integer :family_member_id
    end
  end
end
