class Meeting < ApplicationRecord
  DURATION = [30, 45, 60]
  belongs_to :connection
  # validates :meeting_date_time, :connection_id, :meeting_accepted, :meeting_pending, presence: true

  def self.getAcceptedMeetings(request)
    meetings = Meeting.where(connection_id: request).select(:pending)
    if meetings.include? true
      return meetings.where(pending: true)
    else
      return meetings.where(pending: false)
    end
  end
end
