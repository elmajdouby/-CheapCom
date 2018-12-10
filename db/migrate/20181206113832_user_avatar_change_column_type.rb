class UserAvatarChangeColumnType < ActiveRecord::Migration[5.2]
  def change
    change_column :users, :avatar, :string
  end
end
