class CreateDrives < ActiveRecord::Migration
  def change
    create_table :drives do |t|
      t.string   :year
      t.text     :blurb
      t.date   :start_date
      t.date   :end_date
      t.string   :fundraising_url
      t.text     :fundraising_blurb
      t.boolean  :status, default: true

      t.timestamps
    end
  end
end
