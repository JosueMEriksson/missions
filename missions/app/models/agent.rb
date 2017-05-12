class Agent < ActiveRecord::Base
  attr_accessible :name, :level, :kind, :free, :player_id

  has_many :missions
  belongs_to :player

  validates :name, :kind, :level, presence: true
  validates :level, numericality: {greater_than_or_equal_to: 1, lesser_than_or_equal_to: 100}
  validates :name, uniqueness: true

  def contractable?
    self.player_id.eql?(nil)
  end

end
