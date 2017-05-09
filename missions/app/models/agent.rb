class Agent < ActiveRecord::Base
  attr_accessible :ability, :level, :name, :on_mission
  validates :name, :ability, :level, presence: true
  validates :level, numericality: {greater_than_or_equal_to: 1}
  validates :name, uniqueness: true
end
