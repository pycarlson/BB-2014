class ChangeDriveStartAndEndDataType < ActiveRecord::Migration
  def change
    change_column :drives, :start_date,  :date
    change_column :drives, :end_date,  :date
  end
end
