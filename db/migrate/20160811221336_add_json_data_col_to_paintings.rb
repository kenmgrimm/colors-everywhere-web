class AddJsonDataColToPaintings < ActiveRecord::Migration
  def change
    add_column :paintings, :data, :jsonb
  end
end
