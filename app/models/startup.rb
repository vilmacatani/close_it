class Startup < ApplicationRecord
  belongs_to :user
  validates :funding, :funding_round_end_date, :funding_amount, :industry, :user_id, :headcount, :turnover, presence: true
  has_many :members, dependent: :destroy
end
