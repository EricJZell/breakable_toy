class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  mount_uploader :profile_photo, ProfilePhotoUploader
  validates :user_name, presence: true
  validates :user_name, uniqueness: true
  has_many :entries, dependent: :destroy

  def full_name
    "#{first_name} #{last_name}"
  end
end
