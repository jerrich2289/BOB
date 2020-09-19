class Trade < ApplicationRecord
  belongs_to :item_1, class_name: 'Item', foreign_key: 'item_1_id'
  belongs_to :item_2, class_name: 'Item', foreign_key: 'item_2_id'
end


