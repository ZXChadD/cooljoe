class User < ApplicationRecord

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :joblistings
  has_many :likes
  has_many :conversations
  has_many :messages
  has_many :providers, through: :likes
  has_many :invoices, through: :joblistings

end
