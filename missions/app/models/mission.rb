class Mission < ActiveRecord::Base
  attr_accessible :agent, :description, :reward, :status, :title, :specialty, :agent_id
  
  belongs_to :agent

  validates :title, :description, :reward, :status, presence: true
  validates :reward, numericality: {greater_than_or_equal_to: 1}
  validates :title, uniqueness: true
  
  MISSION_STATUS = {
    sin_asignar: 0,
    en_curso: 1,
    complet_exito: 2,
    fracasada: 3
  }

  def do_mission
    probability = self.specialty.eql?(self.agent.kind) ? 80 : 50

    if rand(1..100) <= probability
      #Mision exitosa
      self.status = 2
      self.agent.level += 1
      self.agent.player.money += self.reward
    else
      #Mision fracasada
      self.status = 3
    end

    self.agent.free = true

    self.save
    self.agent.save
    self.agent.player.save
  end

  def realizable?
    self.status.eql?(1)
  end

  def on_going_mission
  	self.update_attributes(status: 1)
  	self.agent.update_attributes(free: false)
  	true
  end

end
