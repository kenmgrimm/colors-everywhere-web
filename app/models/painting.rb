class Painting < ActiveRecord::Base
  scope :summary, -> {
    select('id', 'latitude', 'longitude', 'direction_degrees').limit(20)
  }

  def api_json
    data.merge({ id: id })
  end
end
