class AddUserIdToPhotos < ActiveRecord::Migration[5.0]
  def change
    add_column :photos, :user_id, :integer
    remove_column :photos, :title, :string
  end
end
