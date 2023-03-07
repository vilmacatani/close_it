class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_many :startups
  has_many :investors
  has_many :connections_as_sender, class_name: "Connection", foreign_key: :sender_id
  has_many :connections_as_receiver, class_name: "Connection", foreign_key: :receiver_id
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
