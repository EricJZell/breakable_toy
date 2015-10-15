class Entry < ActiveRecord::Base
  validates :title, presence: true
  validates :user_id, presence: true
  validates :location_id, presence: true
  validates :date, presence: true
  belongs_to :user
  belongs_to :location
  belongs_to :country
  belongs_to :region
  has_many :photos, dependent: :destroy
  has_many :swell_models, dependent: :destroy

  def set_location
    self.location = find_nearest_location(latitude, longitude)
    self.country = location.country
    self.region = country.region
  end

  def find_nearest_location(lat1, lon1)
    nearest_distance = 1000000
    nearest_location = Location.first
    Location.all.each do |location|
      distance = distance_miles(lat1, lon1, location.lat, location.lon)
      if distance < nearest_distance
        nearest_location = location
        nearest_distance = distance
      end
    end
    nearest_location
  end

  def distance_miles(lat1, lon1, lat2, lon2)
    rmiles = 3956
    rad_per_deg = 0.017453293
    dlon = lon2 - lon1
    dlat = lat2 - lat1
    dlon_rad = dlon * rad_per_deg
    dlat_rad = dlat * rad_per_deg
    lat1_rad = lat1 * rad_per_deg
    lat2_rad = lat2 * rad_per_deg
    a = (Math.sin(dlat_rad / 2))**2 + Math.cos(lat1_rad) *
      Math.cos(lat2_rad) * (Math.sin(dlon_rad / 2))**2
    c = 2 * Math.atan2(Math.sqrt(a), Math.sqrt(1 - a))
    rmiles * c
  end
end
