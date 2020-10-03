class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_one_attached :photo
  has_many :messages
  has_many :items, foreign_key: 'owner_id'
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
def trades
  item_ids=items.pluck(:id)
  Trade.where(item_1_id:item_ids).or(Trade.where(item_2_id:item_ids))
end
end

