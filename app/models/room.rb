class Room < ApplicationRecord
  validates :link_1, presence: true
  validates :room_name, presence: true, length: { maximum: 30 }
end
