class Restaurant < ApplicationRecord
  has_many :reviews, dependent: :destroy
  CATEGORIES = %w[chinese italian japanese french belgian].freeze

  validates :name, :address, presence: true
  validates :phone_number, format: { with: %r([+]*[(]{0,1}[0-9]{1,4}[)]{0,1}[-\\s\\./0-9]*) }, allow_blank: true, allow_nil: true
  validates :category, inclusion: { in: CATEGORIES }
end
