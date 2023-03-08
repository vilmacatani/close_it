class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home]

  def home
    @startups = Startup.all
  end

  # def index
  #   if current_user.user_type == "investor"
  #     @listings = Investor.where(private: false)
  #   else
  #     @listings = Startup.all
  #   end
  # end
end
