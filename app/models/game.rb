require_relative '../uploaders/image_uploader.rb'

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

  mount_uploader :image, ImageUploader

  def self.ordered
      select('games.*, SUM(votes.value) AS votes_value').
        joins(:votes).
        group('games.id').
        where('votes.value > 0').
        order('votes_value DESC')
  end

  def self.negative
      select('games.*, SUM(votes.value) AS votes_value').
        joins(:votes).
        group('games.id').
        where('votes.value < 0').
        order('votes_value DESC')
  end

end
