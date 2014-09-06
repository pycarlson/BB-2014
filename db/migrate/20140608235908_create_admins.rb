class CreateAdmins < ActiveRecord::Migration
  def change
    create_table :admins do |t|
      t.integer  :drive_id
      t.integer  :user_id
      t.string   :email

      t.timestamps
    end
  end
end
