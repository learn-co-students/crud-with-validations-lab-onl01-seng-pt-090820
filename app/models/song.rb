class Song < ApplicationRecord
    validates :title, :artist_name, presence: true
    validates :title, uniqueness: { scope: [:artist_name, :release_year], message: "cannot be repeated by the same artist in the same year." }
    validates :released, inclusion: [true, false]
    validates :release_year, numericality: { less_than_or_equal_to: Date.today.year }, if: :released
end
