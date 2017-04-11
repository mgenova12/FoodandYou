class CreateProfiles < ActiveRecord::Migration[5.0]
  def change
    create_table :profiles do |t|
      t.integer :user_id
      t.integer :height
      t.integer :weight
      t.integer :age
      t.integer :geneder
      t.integer :activity_level
      t.integer :BMI
      t.integer :avg_calories
      t.integer :avg_protein
      t.integer :avg_totalfat
      t.integer :avg_sugar
      t.integer :avg_sodium
      t.integer :avg_choleserol

      t.timestamps
    end
  end
end
