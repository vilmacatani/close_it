class StartsUpController < ApplicationController
  belongs_to :users

  validates :content, presence: true
  before_action :set_user, only: %i[new create]
  def new
    @user = User.find(params[:user_id])
    @starts_up = Startup.new
  end

  def create
    @start_up = Start_up.new(startup_params)
    @start_up.user = @user
    if @start_up.save
      redirect_to user_path(@user)
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def set_user
    @user = User.find(params[:user_id])
  end

  def starts_up_params
    params.require(:start_up).permit(:content)
  end

  def destroy
    @starts_up = Start_up.find(params[:id])
    @start_up.destroy
    redirect_to user_path(@start_up.user), status: :see_other
  end
end
