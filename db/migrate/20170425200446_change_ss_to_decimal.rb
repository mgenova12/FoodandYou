class ChangeSsToDecimal < ActiveRecord::Migration[5.0]
  def change
    change_column :foods, :serving_size, :decimal, :precision => 10, :scale => 1
  end
end
