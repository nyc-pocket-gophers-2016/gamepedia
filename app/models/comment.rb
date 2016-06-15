class Comment < ActiveRecord::Base
  belongs_to :user
  belongs_to :game

  has_many :votes, as: :voteable

  validates :body, :user_id, :game_id, presence: true


end
