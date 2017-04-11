class CreateAddedFoods < ActiveRecord::Migration[5.0]
  def change
    create_table :added_foods do |t|
      t.integer :user_id
      t.integer :food_id
      t.integer :meal_id

      t.timestamps
    end
  end
end
