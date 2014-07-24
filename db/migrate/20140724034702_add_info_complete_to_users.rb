class AddInfoCompleteToUsers < ActiveRecord::Migration
  def change
    add_column :users, :info_complete, :boolean, default: :false
  end
end
