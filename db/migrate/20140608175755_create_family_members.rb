class CreateFamilyMembers < ActiveRecord::Migration
  def change
    create_table :family_members do |t|
      t.integer  :family_id
      t.string   :first_name
      t.string   :gender
      t.string   :size_pants
      t.string   :size_shirt
      t.string   :size_dress
      t.string   :size_shoes
      t.text     :bio
      t.string   :age
    end
  end
end
