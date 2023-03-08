class Investor < ApplicationRecord
  belongs_to :user
  validates :private, :funding_type, :investor_type, :user_id, presence: true

  def new
    @user = User.find(params[:user_id])
    @investor = Investor.new
  end
end
