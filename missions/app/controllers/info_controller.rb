class InfoController < ApplicationController
  def index
  	@messages = Info.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @messages }
    end
  end
end
