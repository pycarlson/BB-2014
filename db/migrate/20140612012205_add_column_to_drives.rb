class AddColumnToDrives < ActiveRecord::Migration
  def change
    add_column :drives, :status, :boolean, default: false
  end
end
