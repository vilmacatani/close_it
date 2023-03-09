class InvestorsController < ApplicationController
  def new
    @investor = Investor.new
    @user = current_user
  end

  def create
    @investor = Investor.new(investor_params)
    @user = current_user
    @investor.user = current_user
    @user.first_name = params[:first_name]
    @user.save
    if @investor.save
      redirect_to root_path
    else
      render :new, status: :unprocessable_entity
    end

  end

  # def update
  # end

  # def index
  # end

  # def show
  # end
  private

  def investor_params
    params.require(:investor).permit(:funding_type, :investor_type, :private, :first_name)
  end
end
