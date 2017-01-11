class Item < ApplicationRecord
  belongs_to :list
  has_many :items

  validates :quantity, :product, presence: true
end
