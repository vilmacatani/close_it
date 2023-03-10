class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home]

  def home
    if params[:query].present?
      @startups = Startup.global_search_startup(params[:query])
    else
      if params[:country].present?
        if filter_params.empty?
          @startups = []
          User.where(country: params[:country]).each { |user| @startups << Startup.find_by(user_id: user.id) }
        else
          @startups = Startup.where(filter_params).where(user_id: User.where(country: params[:country]))
        end
      elsif filter_params.empty?
        @startups = Startup.all
      else
        @startups = Startup.where(filter_params)
      end
    end

    respond_to do |format|
      format.html # Follow regular flow of Rails
      format.text { render partial: "startups/list", locals: { startups: @startups }, formats: [:html] }
    end
  end

  private

  def filter_search
    if params[:country].present?
      if filter_params.empty?
        @startups = []
        User.where(country: params[:country]).each { |user| @startups << Startup.find_by(user_id: user.id) }
      else
        @startups = Startup.where(filter_params).where(user_id: User.where(country: params[:country]))
      end
    elsif filter_params.empty?
      @startups = Startup.all
    else
      @startups = Startup.where(filter_params)
    end
  end

  # def index
  #   if current_user.user_type == "investor"
  #     @listings = Investor.where(private: false)
  #   else
  #     @listings = Startup.all
  #   end
  # end

  def uikit
  end

  def filter_params
    params.permit(:industry, :funding).delete_if { |_key, value| value.blank? }
  end


end
