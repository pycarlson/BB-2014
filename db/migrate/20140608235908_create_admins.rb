class CreateAdmins < ActiveRecord::Migration
  def change
    create_table :admins do |t|
      t.integer :drive_id
      t.integer :user_id
      t.boolean :is_super, default: false

      t.timestamps
    end
  end
end
