class Message < ApplicationRecord
  belongs_to :user
  belongs_to :trade
  belongs_to :chatroom
end
