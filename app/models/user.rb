class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_one_attached :photo
  has_many :trades
  has_many :items, foreign_key: 'owner_id'
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
