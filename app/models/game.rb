class Game < ActiveRecord::Base
  belongs_to :creator, class_name: 'User'
  has_many :comments, dependent: :destroy

  has_many :game_tags
  has_many :tags, through: :game_tags, source: :tag

  has_many :game_users
  has_many :users, through: :game_users, source: :user

  has_many :votes, as: :voteable

  validates :creator_id, :name, :description, :avg_play_time, :min_players, :max_players, presence: true
  validates :name, uniqueness: true
end
