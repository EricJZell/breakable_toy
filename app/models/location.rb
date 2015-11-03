class Location < ActiveRecord::Base
  validates :name, presence: true
  validates :msw_id, presence: true
  validates :lat, presence: true
  validates :lon, presence: true
  validates :msw_url, presence: true
  validates :msw_id, uniqueness: true
  has_many :entries
end
