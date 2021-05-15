class Artist < ApplicationRecord
  has_many :arts
  has_one_attached :picture
end
