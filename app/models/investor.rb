class Investor < ApplicationRecord
  belongs_to :user
  validates :private, :funding_type, :investor_type, :user_id, presence: true
end
