class AddPaperClipToProfile < ActiveRecord::Migration[5.0]
  def change
    add_attachment :profiles, :image
  end
end
