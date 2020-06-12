class CreateTimezones < ActiveRecord::Migration[5.2]
  def change
    create_table :timezones do |t|
      t.string :city
      t.integer :offset
      t.string :time
      t.string :day
      t.string :mode

      t.timestamps
    end
  end
end
