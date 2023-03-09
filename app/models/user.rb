class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  # validates_associated :connections
  has_many :startups, dependent: :destroy
  has_many :investors, dependent: :destroy
  has_many :connections_as_sender, class_name: "Connection", foreign_key: :sender_id
  has_many :connections_as_receiver, class_name: "Connection", foreign_key: :receiver_id
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  def self.get_distinct(user, column)
    User.where(user_type: user).select(column.to_sym).distinct.reorder("#{column} ASC")
  end
end
