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

  def dashboard

    connections_sent = Connection.where(sender_id: current_user)
    connections_received = Connection.where(receiver_id: current_user)
    sent_connection_ids = connections_sent.pluck(:id)
    received_connection_ids = connections_received.pluck(:id)
    connection_ids = sent_connection_ids << received_connection_ids
    my_meetings = Meeting.where(connection_id: connection_ids)

    @my_connection_requests_sent = Connection.where(sender_id: current_user)
    @my_connection_requests_received = Connection.where(receiver_id: current_user)

    start_date = params.fetch(:start_date, Date.today).to_date
    @meetings = my_meetings.where(start_time: start_date.beginning_of_month.beginning_of_week..start_date.end_of_month.end_of_week)

  end


  # def update_status_of_connection_requests
  #   @booking = Booking.find(params[:booking])
  #   @booking.pending = false

  #   if params[:status] == "accept"
  #     @booking.accepted = true
  #   else
  #     @booking.accepted = false
  #   end

  #   @booking.save
  #   redirect_to bookings_path
  # end
  def profile
    @user = current_user
    array = Investor.where(user_id: @user.id)
    @investor = Investor.find(array.first.id)

  end

  def update_profile
    @user = User.find(params[:id])
    array = Investor.where(user_id: @user.id)
    @investor = Investor.find(array.first.id)
    # @investor.update(investor_params)
    @user.update(user_params)
    redirect_to update_profile_path, notice: "Profile updated."
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

  def investor_params
    params.require(:investor).permit(:funding_type, :investor_type, :private)
  end

  def user_params
    params.require(:user).permit(:email, :first_name, :last_name, :company_name, :city, :country, :address)
  end

  def filter_params
    params.permit(:industry, :funding).delete_if { |_key, value| value.blank? }
  end


end
