class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  mount_uploader :profile_photo, ProfilePhotoUploader
  validates :user_name, presence: true
  validates :user_name, uniqueness: true
  has_many :entries, dependent: :destroy
  has_many :locations, through: :entries
  has_many :photos, through: :entries

  has_many :friendships
  has_many :passive_friendships, class_name: "Friendship", foreign_key: "friend_id"

  has_many :active_friends, -> { where(friendships: { accepted: true }) }, through: :friendships, source: :friend
  has_many :passive_friends, -> { where(friendships: { accepted: true }) }, through: :passive_friendships, source: :user
  has_many :pending_friends, -> { where(friendships: { accepted: false }) }, through: :friendships, source: :friend
  has_many :requested_friendships, -> { where(friendships: { accepted: false }) }, through: :passive_friendships, source: :user

  def friends
    active_friends | passive_friends
  end

  def full_name
    "#{first_name} #{last_name}"
  end

  def self.search(search)
    where('user_name ILIKE ?', "%#{search}%")
  end
end
