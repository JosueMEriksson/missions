class HeadquartersController < ApplicationController
  def index
  	@agents = Agent.order(:name)
  	@missions = Mission.order(:title)
  end
end
