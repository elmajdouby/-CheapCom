class CreateTypes < ActiveRecord::Migration[6.0]
  def change
    create_table :types do |t|
      t.datetime :startdate
      t.datetime :enddate
      t.string :label
      t.string :value
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
