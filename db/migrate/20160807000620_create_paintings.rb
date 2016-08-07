class CreatePaintings < ActiveRecord::Migration
  def change
    create_table :paintings do |t|
      t.float :latitude
      t.float :longitude
      t.integer :direction_degrees

      t.timestamps null: false
    end
  end
end
