class Creature < ApplicationRecord
  belongs_to :user
  include PgSearch::Model
  pg_search_scope :search_by_name_and_description,
    against: [ :name, :description, :ability ],
    using: {
    tsearch: { prefix: true } # <-- now `superman batm` will return something!
  }
  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?
end
