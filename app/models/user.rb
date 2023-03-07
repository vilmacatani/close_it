class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_many :connections_as_receiver, class_name: "Connection", foreign_key: :receiver_id

  has_many :connections_as_sender, class_name: "Connection", foreign_key: :sender_id
  validates_associated :connections

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
