class Tag < ApplicationRecord
  has_many :taggings, optional: true
  has_many :lists, through: :taggings


  def to_s
    name
  end

end
