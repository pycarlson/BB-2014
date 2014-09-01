class AddEmailToSuperAdmins < ActiveRecord::Migration
  def change
    add_column :super_admins, :email, :string
  end
end
