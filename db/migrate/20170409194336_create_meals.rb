class CreateMeals < ActiveRecord::Migration[5.0]
  def change
    create_table :meals do |t|
      t.integer :user_id
      t.integer :total_calories
      t.integer :total_protein
      t.integer :total_totalfat
      t.integer :total_sugar
      t.integer :total_sodium
      t.integer :total_cholesterol

      t.timestamps
    end
  end
end
