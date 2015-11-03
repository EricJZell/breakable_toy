class Friendship < ActiveRecord::Base
  validates :user_id, uniqueness: {
    scope: :friend_id,
    message: "already added as friend"
  }
  belongs_to :user
  belongs_to :friend, class_name: "User"
end
