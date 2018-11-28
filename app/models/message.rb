class Message < ApplicationRecord
  belongs_to :room
  belongs_to :user
  validates :content, presence: true
  scope :for_display, -> { order(:created_at).last(50) }
end
