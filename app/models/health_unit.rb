class HealthUnit < ApplicationRecord
  has_one :geocode, inverse_of: :health_unit
  has_one :score, inverse_of: :health_unit
  accepts_nested_attributes_for :geocode, :score
end
