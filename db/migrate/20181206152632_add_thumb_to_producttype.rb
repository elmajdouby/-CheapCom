class AddThumbToProducttype < ActiveRecord::Migration[5.2]
  def change
    add_column :producttypes, :thumb, :string
  end
end
