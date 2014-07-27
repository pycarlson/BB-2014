class AddAdoptorToUsers < ActiveRecord::Migration
  def change
    add_column :users, :adoptor, :boolean, default: :false
  end
end
