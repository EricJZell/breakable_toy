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
end
