class Artist < ApplicationRecord
  has_many :arts, dependent: :destroy
  has_one_attached :picture
end
