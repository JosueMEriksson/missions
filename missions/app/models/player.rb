class Player < ActiveRecord::Base
  attr_accessible :money, :name
  
  has_many :agents
  has_many :missions, through: :agents

  def with_money?
  	self.money >= 500
  end

  def contract(agent)
  	return false unless with_money?
    self.money -= 500
  	agent.player_id = self.id
    self.save
  	agent.save
  end
end
