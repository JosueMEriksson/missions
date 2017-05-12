class Player < ActiveRecord::Base
  attr_accessible :money, :name
  has_many :agents
  has_many :missions, through: :agents

  def with_money?
  	self.money >= 500
  end

  def contract(agent)
  	money = self.money
  	if money >= 500
  		money -= 500
  	else
  		money = 0
  	end

  	self.money = 25
  	agent.player_id = self.id

  	self.save
  	agent.save
  end
end
