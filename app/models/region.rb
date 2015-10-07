class Region < ActiveRecord::Base
  validates :name, presence: true
  validates :name, uniqueness: true
  has_many :countries
  has_many :entries
end
