class CreateProductimages < ActiveRecord::Migration[6.0]
  def change
    create_table :productimages do |t|
      t.text :alt
      t.text :src
      t.references :user, foreign_key: true
      t.references :product, foreign_key: true

      t.timestamps
    end
  end
end
