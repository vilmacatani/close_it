class StartupsController < ApplicationController
  before_action :set_user, only: %i[new create]
  def show
    @startup = Startup.find(params[:id])
    @connection = Connection.new
  end

  def index
    @startups = @Startup.all
  end

  def team
    @start_up = Startup.find(params[:id])
    @members = @start_up.members
  end

  def new
    @user = User.find(params[:user_id])
    @start_ups = Startup.new
  end

  def create
    @start_ups = Start_up.new(startup_params)
    @start_ups.user = @user
    @start_up = Start_up.connection
    if @start_up.save
      redirect_to user_path(@user)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @start_ups = Start_up.find(params[:id])
    @start_ups.destroy
    redirect_to user_path(@start_up.user), status: :see_other
  end

  private

  def set_user
    @user = User.find(params[:user_id])
  end

  def starts_up_params
    params.require(:start_up).permit(:content)
  end

end
