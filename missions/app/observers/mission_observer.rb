class MissionObserver < ActiveRecord::Observer
  def after_create(mission)
  	Info.create(
      message: "Se ha creado la misión \"#{mission.title}\".",
      player_id: Player.first.id)

    true
  end

  def before_save(mission)
  	start_mission(mission)
    solve_mission(mission)

    true
  end

  protected

  def start_mission(mission)
		if mission.changes.keys.include?("status") and mission.status.eql?(Mission::MISSION_STATUS[:en_curso])
  		Info.create(message: "Se ha iniciado la misión \"#{mission.title}\".",
        player_id: Player.first.id)
  	end
  end

  def solve_mission(mission)
    if mission.changes.keys.include?("status") and mission.status.eql?(Mission::MISSION_STATUS[:completada_exito])
      Info.create(message: "La misión \"#{mission.title}\" ha sido completada con éxito. ¡ENHORABUENA!",
        player_id: Player.first.id)
    end

    if mission.changes.keys.include?("status") and mission.status.eql?(Mission::MISSION_STATUS[:fracasada])
      Info.create(message: "La misión \"#{mission.title}\" ha resultado un fracaso...",
        player_id: Player.first.id)
    end
  end
end