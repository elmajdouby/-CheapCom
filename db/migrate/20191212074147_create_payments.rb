class CreatePayments < ActiveRecord::Migration[6.0]
  def change
    create_table :payments do |t|
      t.string :webtransaction
      t.string :amount
      t.references :subscription, null: false, foreign_key: true
      t.references :type, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
