class Painting < ActiveRecord::Base
  has_many :strokes, dependent: :destroy
  accepts_nested_attributes_for :strokes


  def as_json(options={})
    super(
      only: [:id, :latitude, :longitude, :direction_degrees],
      include: {
        strokes: {
          only: [:id, :painting_id, :brush_type, :color, :brush_width],
          include: {
            points: {
              only: [:id, :stroke_id, :position_x, :position_y, :position_z]
            }
          }
        }
      }
    )
  end
end
