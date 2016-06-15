class GameTag < ActiveRecord::Base
  belongs_to :tag
  belongs_to :game

  validates :game_id, :tag_id, presence: true
end
