class Art < ApplicationRecord
  belongs_to :artist
  has_many :art_items
  has_one_attached :picture

end
