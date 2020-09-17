class Message < ApplicationRecord
  belongs_to :user_id
  belongs_to :trade_it
end
