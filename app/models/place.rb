class Place < ApplicationRecord
  belongs_to :illustration

  validates :illustration, presence: { message: 'must be supplied' }
end
