class CreateProducttypes < ActiveRecord::Migration[6.0]
  def change
    create_table :producttypes do |t|
      t.string :name
      t.string :description
      t.string :thumb
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
