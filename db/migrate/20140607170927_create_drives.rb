class CreateDrives < ActiveRecord::Migration
  def change
    create_table :drives do |t|
      t.string   :year
      t.text     :blurb
      t.string   :start_date
      t.string   :end_date
      t.string   :fundraising_url
      t.text     :fundraising_blurb
      t.string   :donation_receipt_link

      t.timestamps
    end
  end
end
