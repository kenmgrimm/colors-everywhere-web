class CreateStrokes < ActiveRecord::Migration
  def change
    create_table :strokes do |t|
      t.references :painting, foreign_key: true
      t.integer :brush_type
      t.string :color

      t.timestamps null: false
    end
  end
end
