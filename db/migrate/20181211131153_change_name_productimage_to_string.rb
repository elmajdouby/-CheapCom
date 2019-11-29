class ChangeNameProductimageToString < ActiveRecord::Migration[6.0]
  def change
    change_column :productimages, :alt, :string
  end
end
