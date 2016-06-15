class User < ActiveRecord::Base
  validates  :username,:email, presence: true, uniqueness: true
  validates_format_of :email, with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i, on: :create
  has_secure_password

  has_many :created_games, class_name: 'Game', foreign_key: 'creator_id'

  has_many :game_users
  has_many :games, through: :game_users, source: :game

  has_many :friendships
  has_many :friends, through: :friendships
  has_many :inverse_friendships, class_name: "Friendship", foreign_key: "friend_id"
  has_many :inverse_friends, through: :inverse_friendships, source: :user

  has_many :comments
  has_many :votes
end
