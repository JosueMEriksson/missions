class Agent < ActiveRecord::Base
  attr_accessible :name, :level, :kind
  validates :name, :kind, :level, presence: true
  validates :level, numericality: {greater_than_or_equal_to: 1, lesser_than_or_equal_to: 100}
  validates :name, uniqueness: true
  has_many :missions


  def do_mission()

  end

end
