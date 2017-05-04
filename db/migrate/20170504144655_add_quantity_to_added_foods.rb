class AddQuantityToAddedFoods < ActiveRecord::Migration[5.0]
  def change
    add_column :added_foods, :quantity, :integer
  end
end
