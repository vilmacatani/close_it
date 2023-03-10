class Investor < ApplicationRecord

  belongs_to :user
  INVESTORS = ["Angel Investor", "Peer-to-Peer Lender", "Personal Investor", "Bank", "Venture Capitalist"]
  FUNDINGS = ["Pre-Seed", "Seed","Series A", "Series B", "Series C"]
  # validates :private, :funding_type, :investor_type, :user_id, presence: true
  validates :investor_type, inclusion: { in: INVESTORS }
  validates :funding_type, inclusion: { in: FUNDINGS }

  after_create :set_type
  validates :investor_type, inclusion: { in: INVESTORS }
  validates :funding_type, inclusion: { in: FUNDINGS }

  def set_type
    self.user.update(user_type: "investor")
  end
end
