class ChangeNameProductimageToString < ActiveRecord::Migration[5.2]
  def change
    change_column :productimages, :alt, :string
  end
end
