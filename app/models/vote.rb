class Vote < ActiveRecord::Base
  belongs_to :user
  belongs_to :voteable, polymorphic: true

  validates :user_id, :value, presence: true
  validates_inclusion_of :value, :in => [-1, 1]

end
