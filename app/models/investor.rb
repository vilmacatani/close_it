class Investor < ApplicationRecord
  belongs_to :user
<<<<<<< HEAD
  validates :private, :funding_type, :investor_type, :user_id, presence: true

  def new
    @user = User.find(params[:user_id])
    @investor = Investor.new
  end
=======
  # validates :private, :funding_type, :investor_type, :user_id, presence: true
>>>>>>> 0e16ded05713a1f10347f10c51d2a962cb0b5612
end
