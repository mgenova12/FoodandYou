class AddNameToAddedFoods < ActiveRecord::Migration[5.0]
  def change
    add_column :added_foods, :name, :string

  end
end
