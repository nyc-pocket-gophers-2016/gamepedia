class Tag < ActiveRecord::Base
  has_many :game_tags
  has_many :games, through: :game_tags, source: :game

  validates :name, presence: true, uniqueness: true
end
