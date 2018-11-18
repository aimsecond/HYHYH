class ActiveUser < ApplicationRecord
  belongs_to :room, optional: true
end
