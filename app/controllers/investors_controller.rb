class InvestorsController < ApplicationController
  def new
    @investor = Investor.new
  end

  def create
    @investor = Investor.new(investor_params)
    @investor.user = current_user
    
    if @investor.save
      redirect_to root_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def investor_params
    params.require(:investor).permit(:funding_type, :investor_type, :private)
  end
end
