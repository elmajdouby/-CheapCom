class AddFieldsToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :username, :string
    add_column :users, :fistname, :string
    add_column :users, :lastname, :string
    add_column :users, :avatar, :text
  end
end
