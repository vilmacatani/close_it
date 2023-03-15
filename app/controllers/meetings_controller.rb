class MeetingsController < ApplicationController
  before_action :set_connection, only: %i[create]


  def create
    @meeting = Meeting.new(meeting_params)
    # @meeting.meeting_pending = true
    # @meeting.meeting_accepted = false
    # change this back
    @meeting.meeting_pending = false
    @meeting.meeting_accepted = true
    @meeting.connection_id = @connection.id
    @meeting.end_time = params[:meeting][:start_time].to_datetime + params[:meeting][:duration].to_i.minutes

    if @meeting.save
      redirect_to dashboard_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
  end

  def check_availability(new_meeting, existing_meetings)
    new_booking_range = (new_booking.start_date..new_booking.end_date)
    available = true
    booking_range = nil
    existing_bookings.each do |existing_booking|
      existing_booking_range = (existing_booking.start_date..existing_booking.end_date)
      if (new_booking_range.overlaps? existing_booking_range) && existing_booking.accepted
        available = false
        booking_range = [existing_booking.start_date, existing_booking.end_date]
        break
      end
    end
    return [available, booking_range]
  end

  private
  def set_connection
    @connection = Connection.find(params[:connection_id])
  end

  def meeting_params
    params.require(:meeting).permit(:start_time, :duration, :title)
  end
end
