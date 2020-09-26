class Item < ApplicationRecord
  belongs_to :owner, class_name: 'User', foreign_key: 'owner_id'
  has_many :trades
  has_many_attached :photos
  before_save :image_count
  validates :photos, presence: true
  validates :name, presence: true
  validates :size, presence: true
  # validates :size, presence: true (once the sizing gets done then the turn on the validation)

private
  def image_count
    errors[:base] << "you must upload an image" if self.photos.empty?
    errors[:base] << "you can only upload 3 images" if self.photos.length > 3
  end
end

