class CreatePoints < ActiveRecord::Migration
  def change
    create_table :points do |t|
      t.references :stroke, foreign_key: true
      t.float :position_x
      t.float :position_y
      t.float :position_z

      t.timestamps null: false
    end
  end
end
