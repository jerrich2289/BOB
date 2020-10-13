class Message < ApplicationRecord
  belongs_to :user
  belongs_to :trade
  scope :unread, ->(){where(read: false)}
end
