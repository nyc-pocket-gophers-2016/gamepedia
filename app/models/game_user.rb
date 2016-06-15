class GameUser < ActiveRecord::Base
  belongs_to :user
  belongs_to :game

  validates :user_id, :game_id, presence: true
end
