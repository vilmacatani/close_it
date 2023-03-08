class Startup < ApplicationRecord
  belongs_to :user
  # validates :funding, :funding_round_end, :funding_amount, :industry, :user_id, :headcount, :turnover, presence: true
  has_many :members

  def self.get_distinct(column)
    Startup.select(column.to_sym).distinct.reorder("#{column} ASC")
  end
end
