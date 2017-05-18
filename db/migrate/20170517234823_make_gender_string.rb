class MakeGenderString < ActiveRecord::Migration[5.0]
  def change
    change_column :profiles, :geneder, :string
  end
end
