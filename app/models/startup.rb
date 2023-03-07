class Startup < ApplicationRecord
  belongs_to :user
  validates :funding, :funding_round_end, :funding_amount, :industry, :user_id, :headcount, :turnover, presence: true
end
