class CreateSearcheds < ActiveRecord::Migration[6.0]
  def change
    create_table :searcheds do |t|
      t.string :keyword
      t.string :location
      t.references :user, foreign_key: true
      t.references :producttype, foreign_key: true

      t.timestamps
    end
  end
end
