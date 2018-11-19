class Room < ApplicationRecord
  validates :link_1, presence: true
  validates :room_name, uniqueness: true, presence: true, length: { maximum: 30 }
  validates :host_id, presence: true
  validate :valid_url
  has_many :users
  has_one :active_user, dependent: :destroy
  scope :recent, -> {order(created_at: :desc)}
  scope :oldest, -> {order(created_at: :asc)}
  scope :mostUser, -> {joins(:active_user).order('active_users.user_count DESC')}
end

private 

def valid_url
  unless link_1.include? "watch?v="
    errors.add(:link_1, "Wrong link format")
  end
end
