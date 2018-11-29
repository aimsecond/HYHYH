class Playlist < ApplicationRecord
  scope :recent, -> {order(updated_at: :desc)}
  scope :mostPlayed, -> {order(count: :desc)}
end
