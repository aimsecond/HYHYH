class User < ApplicationRecord
  has_many :messages
  belongs_to :room, optional: true
  validates :username, presence: true, length: { maximum: 30 }, 
                       uniqueness: {case_sensitive: false}
                  
  validate :validate_room_id, on: :update
          
  has_secure_password
  validates :password, presence: true, length: { minimum: 6 }
  
  
  def validate_room_id
    room = Room.find(id)
    if room.nil?
      errors.add(:id, 'Invalid Room ID')
    end
  end
  
end
