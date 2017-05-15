class MissionObserver < ActiveRecord::Observer
  def after_create(mission)
  	mission.player.info.create(message: "Se ha creado la misión \"#{mission.title}\".")
  end

  def before_save(mission)
  	start_mission(mission)
  end

  protected

  def start_mission(mission)
		if mission.changes.keys.include?("status") and mission.status.eql?(MISSION_STATUS[:en_curso])
  		mission.player.info.create(message: "Has contratado al agente #{agent.name}.")
  	end
  end
end