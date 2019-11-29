class CreateSubscriptions < ActiveRecord::Migration[6.0]
  def change
    create_table    :subscriptions do |t|
      t.datetime    :startdate
      t.datetime    :enddate
      t.string      :package
      t.text        :member, array: true
      t.text        :membersuplement, array: true
      t.text        :tennis, array: true
      t.string      :amount
      t.string      :status
      t.references  :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
