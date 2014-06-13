class CreateSuperAdmins < ActiveRecord::Migration
  def change
    create_table :super_admins do |t|
      t.integer :drive_id
      t.integer :user_id

      t.timestamps
    end
  end
end
