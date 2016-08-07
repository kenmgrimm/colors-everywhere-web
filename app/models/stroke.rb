class Stroke < ActiveRecord::Base
  has_many :points, dependent: :destroy
  accepts_nested_attributes_for :points

  belongs_to :painting
end
