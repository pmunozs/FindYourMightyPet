class Creature < ApplicationRecord
  belongs_to :user
  geocoded_by :address
  after_validation :geocode

  validates :name, presence: true

  include PgSearch::Model
  pg_search_scope :search_by_name_and_description,
    against: [ :name, :description, :ability ],
    using: {
    tsearch: { prefix: true } # <-- now `superman batm` will return something!
  }
end
