class CreateDropDates < ActiveRecord::Migration
  def change
    create_table :drop_dates do |t|
      t.date     :date
      t.time     :start_time
      t.time     :end_time
      t.integer  :drop_location_id

      t.timestamps
    end
  end
end
