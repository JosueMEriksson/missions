class Player < ActiveRecord::Base
  attr_accessible :money, :name
  has_many :agents
  has_many :missions, through: :agents
end
