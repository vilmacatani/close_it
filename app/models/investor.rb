class Investor < ApplicationRecord
  INVESTORS = ["Angel Investor", "Peer-to-Peer Lenders", "Personal Investors", "Banks", "Venture Capitalists"]
  FUNDINGS = ["Pree-Seed", "Seed", "Series A", "Series B", "Series C", "Series D"]
  belongs_to :user

  # validates :private, :funding_type, :investor_type, :user_id, presence: true

  after_create :set_type
  validates :investor_type, inclusion: { in: INVESTORS }
  validates :funding_type, inclusion: { in: FUNDINGS }

  def set_type
    self.user.update(user_type: "investor")
  end
end
