class Creature < ApplicationRecord
  belongs_to :user
  geocoded_by :address
  after_validation :geocode

  validates :name, :age, :ability, :description, :address, presence: true

  has_one_attached :photo

  include PgSearch::Model
  pg_search_scope :search_by_name_and_description,
    against: [ :name, :description, :ability ],
    using: {
    tsearch: { prefix: true } # <-- now `superman batm` will return something!
  }
end
