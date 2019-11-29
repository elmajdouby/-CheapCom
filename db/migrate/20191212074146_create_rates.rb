class CreateRates < ActiveRecord::Migration[6.0]
  def change
    create_table    :rates do |t|
      t.datetime    :startdate
      t.datetime    :enddate
      t.string      :description
      t.integer     :value
      t.references  :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
