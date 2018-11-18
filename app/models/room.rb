class Room < ApplicationRecord
  validates :link_1, presence: true
  validates :room_name, presence: true, length: { maximum: 30 }
  validates :host_id, presence: true
  validate :valid_url
  has_many :users
  has_one :active_user, dependent: :destroy
end

private 

def valid_url
  unless link_1.include? "watch?v="
    errors.add(:link_1, "Wrong link format")
  end
end
