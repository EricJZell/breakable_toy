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
  has_many :photos, through: :entries, dependent: :destroy

  has_many :friendships, dependent: :destroy
  has_many :passive_friendships, class_name: "Friendship", foreign_key: "friend_id", dependent: :destroy

  has_many :active_friends, -> { where(friendships: { accepted: true }) }, through: :friendships, source: :friend, dependent: :destroy
  has_many :passive_friends, -> { where(friendships: { accepted: true }) }, through: :passive_friendships, source: :user, dependent: :destroy
  has_many :pending_friends, -> { where(friendships: { accepted: false }) }, through: :friendships, source: :friend, dependent: :destroy
  has_many :requested_friendships, -> { where(friendships: { accepted: false }) }, through: :passive_friendships, source: :user, dependent: :destroy

  def friends
    active_friends | passive_friends
  end

  def full_name
    "#{first_name} #{last_name}"
  end

  def self.search(search)
    where('LOWER(first_name || \' \' || last_name) LIKE ? or \
    LOWER(user_name) LIKE ? ', "%#{search.downcase}%", "%#{search.downcase}%")
  end
end
