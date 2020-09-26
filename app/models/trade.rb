class Trade < ApplicationRecord
  belongs_to :item_1, class_name: 'Item', foreign_key: 'item_1_id'
  belongs_to :item_2, class_name: 'Item', foreign_key: 'item_2_id'

#   belongs_to :user
#   has_many :photos, dependent: :destroy
# end


  def random
    all.shuffle.first
  end
end


