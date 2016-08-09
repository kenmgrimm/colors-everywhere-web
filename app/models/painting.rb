class Painting < ActiveRecord::Base
  has_many :strokes, dependent: :destroy
  accepts_nested_attributes_for :strokes


  def as_json(options={})
    super(
      only: [:latitude, :longitude, :direction_degrees],
      include: {
        strokes: {
          only: [:brush_type, :color],
          include: {
            points: {
              only: [:position_x, :position_y, :position_z]
            }
          }
        }
      }
    )
  end
end
