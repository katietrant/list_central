class List < ApplicationRecord
  belongs_to :user
  has_many :items
  # has_many :taggings, dependent: :nullify
  has_many :tags, through: :tagging
end
