class AddStatusToAddedFoods < ActiveRecord::Migration[5.0]
  def change
    add_column :added_foods, :status, :string
    rename_column :foods, :quanity, :quantity
    add_column :foods, :serving_size, :integer

  end
end
