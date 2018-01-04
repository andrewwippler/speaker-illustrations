class Illustration < ApplicationRecord
  has_many :ill_tag
  has_many :tags, through: :ill_tag
  has_many :places

  validates :title, presence: { message: 'must be supplied' }
  validates :content, presence: { message: 'must be supplied' }
end
