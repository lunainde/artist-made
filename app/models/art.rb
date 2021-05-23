class Art < ApplicationRecord
  belongs_to :artist
  has_many :art_items, dependent: :destroy
  has_one_attached :picture
  acts_as_favoritable
end
