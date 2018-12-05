class RemoveSrcFromProductimage < ActiveRecord::Migration[5.2]
  def change
    remove_column :productimages, :src, :text
  end
end
