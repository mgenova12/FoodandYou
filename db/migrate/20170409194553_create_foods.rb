class CreateFoods < ActiveRecord::Migration[5.0]
  def change
    create_table :foods do |t|
      t.string :name
      t.integer :quanity
      t.integer :calories
      t.integer :protein
      t.integer :totalfat
      t.integer :sugar
      t.integer :sodium
      t.integer :cholesterol

      t.timestamps
    end
  end
end
