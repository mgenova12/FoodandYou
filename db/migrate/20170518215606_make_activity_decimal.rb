class MakeActivityDecimal < ActiveRecord::Migration[5.0]
  def change
    change_column :profiles, :activity_level, :decimal, :precision => 10, :scale => 3

  end
end
