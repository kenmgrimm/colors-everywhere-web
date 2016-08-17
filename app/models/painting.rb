class Painting < ActiveRecord::Base
  # has_many :strokes, dependent: :destroy
  # accepts_nested_attributes_for :strokes

    def api_json
      data.merge({ id: id })
    end

end
