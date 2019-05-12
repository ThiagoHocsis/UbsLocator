class Geocode < ApplicationRecord
  belongs_to :health_unit

  scope :geocode_ubs,
        lambda {|lat, long|
          where("lat = ? AND long = ?",lat, long)
        }
end
