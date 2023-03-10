class Investor < ApplicationRecord
  INVESTORS = ["Angel Investor", "Peer-to-Peer Lenders", "Personal Investors", "Banks", "Venture Capitalists"]
  FUNDINGS = ["Series A", "Series B", "Series C", "Series D"]
  belongs_to :user
  INVESTORS = ["Angel Investor", "Peer-to-Peer Lenders", "Personal Investors", "Banks", "Venture Capitalists"]
  FUNDINGS = ["Series A", "Series B", "Series C", "Series D"]
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
