class Art < ApplicationRecord
  belongs_to :artist
  has_many :art_items
end
