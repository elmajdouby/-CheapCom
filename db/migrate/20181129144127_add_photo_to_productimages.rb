class AddPhotoToProductimages < ActiveRecord::Migration[5.2]
  def change
    add_column :productimages, :photo, :string
  end
end
