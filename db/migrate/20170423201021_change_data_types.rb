class ChangeDataTypes < ActiveRecord::Migration[5.0]
  def change
    change_column :foods, :calories, :decimal, :precision => 10, :scale => 2
    change_column :foods, :protein, :decimal, :precision => 10, :scale => 2
    change_column :foods, :totalfat, :decimal, :precision => 10, :scale => 2
    change_column :foods, :sugar, :decimal, :precision => 10, :scale => 2
    change_column :foods, :cholesterol, :decimal, :precision => 10, :scale => 2
    change_column :foods, :sodium, :decimal, :precision => 10, :scale => 2
  end
end
