class CreateDropDates < ActiveRecord::Migration
  def change
    create_table :drop_dates do |t|
      t.datetime :date_and_time
      t.integer  :drop_location_id

      t.timestamps
    end
  end
end
