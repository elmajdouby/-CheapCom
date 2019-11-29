class CreateMembers < ActiveRecord::Migration[6.0]
  def change
    create_table    :members do |t|
      t.datetime    :startdate
      t.datetime    :enddate
      t.string      :firstname
      t.string      :lastname
      t.string      :birthdate
      t.integer     :sexe
      t.text        :avatar
      t.references  :type, null: false, foreign_key: true
      t.references  :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
