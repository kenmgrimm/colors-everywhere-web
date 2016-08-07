class Stroke < ActiveRecord::Base
  has_many :points
  belongs_to :painting
end
