module ApplicationHelper
	def status_mission(status)
		{0 => 'Sin asignar',
		 1 => 'En curso',
		 2 => 'Completada con éxito',
		 3 => 'Fracasada'}[status]
	end

	def status_agent(free)
		if free
			'Libre'
		else
			'Ocupado'
		end
	end

	def show_specialty(spec)
		Specialty::SPECIALTIES[spec.to_i]
	end
end
