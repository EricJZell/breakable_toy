class Photo < ActiveRecord::Base
  validates :file_name, presence: true
  validates :entry_id, presence: true
  belongs_to :entry
  mount_uploader :file_name, EntryPhotoUploader
end
