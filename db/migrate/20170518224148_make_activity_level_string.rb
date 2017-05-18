class MakeActivityLevelString < ActiveRecord::Migration[5.0]
  def change
    change_column :profiles, :activity_level, :string
  end
end
