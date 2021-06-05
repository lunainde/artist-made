class Art < ApplicationRecord
  belongs_to :artist
  has_many :art_items, dependent: :destroy
  has_one_attached :picture
  acts_as_favoritable

  include PgSearch::Model
  pg_search_scope :global_search,
    against: [ :title, :art_theme ],
    associated_against: {
      artist: [ :first_name, :last_name ]
    },
    using: {
      tsearch: { prefix: true }
    }

end
