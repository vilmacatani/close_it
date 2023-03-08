class Meeting < ApplicationRecord
  belongs_to :connection
  validates :meeting_time, :connection_id, :meeting_accepted, :meeting_pending, presence: true
end
