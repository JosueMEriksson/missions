class Mission < ActiveRecord::Base
  attr_accessible :agent, :description, :reward, :status, :title, :specialty, :agent_id
  validates :title, :description, :reward, :status, presence: true
  validates :reward, numericality: {greater_than_or_equal_to: 1}
  validates :title, uniqueness: true
  belongs_to :agent
  
  before_update :on_going_mission

  def do_mission
    probability = if self.specialty.eql?(self.agent.kind)
      80
    else
      50
    end

    if rand(1..100) <= probability
      #Mision exitosa
      self.status = 2
      self.agent.level += 1
      self.agent.player.money += self.reward
    else
      #Mision fracasada
      self.status = 3
      self.agent.level += 1
    end

    self.agent.free = true

    self.save
    self.agent.save
    self.agent.player.save
  end

  def realizable?
    self.status.eql?(1)
  end

  protected

  def on_going_mission
  	self.status = 1
  	self.agent.update_attributes(free: false)
  	true
  end

end
