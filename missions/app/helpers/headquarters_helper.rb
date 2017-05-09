module HeadquartersHelper
	def status_agent(onmission)
		if onmission
			'Ocupado'
		else
			'Libre'
		end
	end

	def status_mission(status)
		if status == "0"
			'Sin asignar'
		elsif status == "1"
			'En curso'
		elsif status == "2"
			'Completada con éxito'
		elsif status == "3"
			'Fracasada'
		else
			'Sin estado'
		end
	end
end
