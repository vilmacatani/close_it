class Investor < ApplicationRecord
  belongs_to :user
  validates :private, :funding, :investor_type, :user_id, presence: true
end
