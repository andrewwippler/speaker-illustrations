class Tag < ApplicationRecord
  has_many :ill_tag
  has_many :illustrations, through: :ill_tag

  validates :name, presence: { message: 'must be supplied' }
end
