class MissionsController < ApplicationController
  # GET /missions
  # GET /missions.json
  def index
    @missions = Mission.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @missions }
    end
  end

  # GET /missions/1
  # GET /missions/1.json
  def show
    @mission = Mission.find(params[:id])
    @free_agents = Agent.order(:name).where(player_id: Player.first.id, free: true)

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @mission }
    end
  end

  # GET /missions/new
  # GET /missions/new.json
  def new
    @mission = Mission.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @mission }
    end
  end

  # GET /missions/1/edit
  def edit
    @mission = Mission.find(params[:id])
  end

  # POST /missions
  # POST /missions.json
  def create
    @mission = Mission.new(params[:mission])

    respond_to do |format|
      if @mission.save
        format.html { redirect_to @mission, notice: 'Mission was successfully created.' }
        format.json { render json: @mission, status: :created, location: @mission }
      else
        format.html { render action: "new" }
        format.json { render json: @mission.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /missions/1
  # PUT /missions/1.json
  def update
    @mission = Mission.find(params[:id])

    respond_to do |format|
      if @mission.update_attributes(params[:mission])
        format.html { redirect_to @mission, notice: 'Mission was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @mission.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /missions/1
  # DELETE /missions/1.json
  def destroy
    @mission = Mission.find(params[:id])
    @mission.destroy

    respond_to do |format|
      format.html { redirect_to missions_url }
      format.json { head :no_content }
    end
  end

  def solve
    @mission = Mission.find(params[:id])
    @mission.do_mission if @mission
    # @missions = Mission.all
    respond_to do |format|
      format.js
    end
    # redirect_to headquarters_path
  end

  def start_mission
    @mission = Mission.find(params[:id])
    if @mission.update_attributes(params[:mission])
      @mission.on_going_mission
      redirect_to @mission, notice: 'La misión ha comenzado.'
    end
  end
end
