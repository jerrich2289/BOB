class Item < ApplicationRecord
  belongs_to :owner, class_name: 'User', foreign_key: 'owner_id'
  has_one_attached :photo
  validates :photo, presence: true
  validates :name, presence: true
  # validates :size, presence: true (once the sizing gets done then the turn on the validation)
end
