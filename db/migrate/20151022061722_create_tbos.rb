class CreateTbos < ActiveRecord::Migration
  def change
    create_table :tbos do |t|
      t.string :name
      t.string :part_number
      t.float :tbo
      t.float :elapsed_time
      t.float :remaining_time

      t.timestamps null: false
    end
  end
end
