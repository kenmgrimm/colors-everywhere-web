class Painting < ActiveRecord::Base
    def api_json
      data.merge({ id: id })
    end
end
