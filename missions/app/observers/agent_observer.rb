class AgentObserver < ActiveRecord::Observer
  def after_create(agent)
  	Info.create(
      message: "Se ha creado el agente #{agent.name}.",
      player_id: Player.first.id)

  	true
  end

  def before_save(agent)
  	hire_agent(agent)
  	
  	true
  end

  protected

  def hire_agent(agent)
  	if agent.changes.keys.include?("player_id") and not agent.player_id.blank?
  		Info.create(
        message: "Has contratado al agente #{agent.name}.",
        player_id: agent.player_id)
  	end
  end
end