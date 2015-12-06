class CreateHsSessions < ActiveRecord::Migration
  def change
    create_table :hs_sessions do |t|
      t.datetime :timein
      t.datetime :timeout
      t.float :diff
      t.belongs_to :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
