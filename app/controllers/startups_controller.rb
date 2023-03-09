class StartupsController < ApplicationController
  def index
  end

  def show
  end

  def new
  end

  def create
  end

  def team
    @startup = Startup.find(params[:id])
    @teammembers = @startup.members
  end
end
