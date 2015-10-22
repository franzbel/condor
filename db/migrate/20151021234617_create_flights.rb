class CreateFlights < ActiveRecord::Migration
  def change
    create_table :flights do |t|
      t.float :hours
      t.float :minutes
      t.float :seconds
      t.float :total

      t.timestamps null: false
    end
  end
end
