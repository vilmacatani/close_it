class Connection < ApplicationRecord
  validates :connection_type, :pending, :accepted, :receiver_id, :sender_id, presence: true
end
