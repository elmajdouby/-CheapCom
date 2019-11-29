class AddPhotoToProductimages < ActiveRecord::Migration[6.0]
  def change
    add_column :productimages, :photo, :string
  end
end
