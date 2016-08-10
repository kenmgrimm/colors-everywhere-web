class AddBrushWidthToStroke < ActiveRecord::Migration
  def change
    add_column :strokes, :brush_width, :float
  end
end
