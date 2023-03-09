class Startup < ApplicationRecord
  belongs_to :user
  # validates :funding, :funding_round_end, :funding_amount, :industry, :user_id, :headcount, :turnover, presence: true
  has_many :members

  include PgSearch::Model
  pg_search_scope :global_search_startup,
    against: [ :funding, :industry ],
    associated_against: {
      user: [ :company_name, :user_type, :city, :country ]
    },
    using: {
    tsearch: { prefix: true }
    }

  def self.get_distinct(column)
    Startup.select(column.to_sym).distinct.reorder("#{column} ASC")
  end
end
