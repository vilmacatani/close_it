class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home]

  def home
    if params[:industry].present? || params[:country].present? || params[:funding].present?

      @startups = Startup.where(industry: params[:industry]).where(funding: params[:funding])
      users = User.where(country: params[:country])
      @startups = @startups.where(user_id: users)

    else
      @startups = Startup.all
    end
  end

end
