class Startup < ApplicationRecord
  INDUSTRIES = ["Delivery", "Healthcare Tech", "Artificial Intelligence",
    "Educational Technology", "Financial Technology", "Shared Mobility", "Supply Chain Management & Logistics",
    "Real Estate", "Ecommerce", "Big Data", "Blockchain Technology", "B2B Software", "Retail"]
  belongs_to :user
  # validates :funding, :funding_round_end, :funding_amount, :industry, :user_id, :headcount, :turnover, presence: true
  has_many :members

  validates :industry, inclusion: { in: INDUSTRIES }
  after_create :set_type

  # PG Search
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

  def set_type
    self.user.update(user_type: "startup")
  end
end
