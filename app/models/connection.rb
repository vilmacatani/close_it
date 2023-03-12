class Connection < ApplicationRecord
  # validates :connection_type, :pending, :accepted, :receiver_id, :sender_id, presence: true
  belongs_to :sender, class_name: "User"
  belongs_to :receiver, class_name: "User"
  has_many :meetings
end
