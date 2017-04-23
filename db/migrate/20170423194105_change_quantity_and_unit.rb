class ChangeQuantityAndUnit < ActiveRecord::Migration[5.0]
  def change
    add_column :foods, :unit, :string
    remove_column :foods, :quantity, :integer

  end
end
