class AgentObserver < ActiveRecord::Observer
  def after_create(agent)
  	agent.player.info.create(message: "Se ha creado el agente #{agent.name}.")

  	true
  end

  def before_save(agent)
  	hire_agent(agent)
  	
  	true
  end

  protected

  def hire_agent(agent)
  	if agent.changes.keys.include?("player_id") and not agent.player_id.blank?
  		agent.player.info.create(message: "Has contratado al agente #{agent.name}.")
  	end
  end
end