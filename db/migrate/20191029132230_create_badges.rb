class CreateBadges < ActiveRecord::Migration[6.0]
  def change
    create_table :badges do |t|
      t.datetime :startdate
      t.datetime :enddate
      t.string :number
      t.references :member, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
