class SwellModel < ActiveRecord::Base
  validates :entry_id, presence: true
  belongs_to :entry
end
