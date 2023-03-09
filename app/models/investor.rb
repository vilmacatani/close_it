class Investor < ApplicationRecord
  belongs_to :user
  # validates :private, :funding_type, :investor_type, :user_id, presence: true
  after_create :set_type
  def set_type
    self.user.update(user_type: "investor")
  end
end
