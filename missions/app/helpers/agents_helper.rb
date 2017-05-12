module AgentsHelper
	def contracted(id)
		if id
			'Contratado'
		else
			'Desempleado'
		end
	end
end
