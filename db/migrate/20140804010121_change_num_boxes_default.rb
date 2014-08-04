class ChangeNumBoxesDefault < ActiveRecord::Migration
  def change
    change_column :families, :num_boxes, :integer, :default => 0
  end
end
