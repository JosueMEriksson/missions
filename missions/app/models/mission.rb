class Mission < ActiveRecord::Base
  attr_accessible :agent, :description, :reward, :status, :title, :specialty
  validates :title, :description, :reward, :status, presence: true
  validates :reward, numericality: {greater_than_or_equal_to: 1}
  validates :title, uniqueness: true
  belongs_to :agent

end
