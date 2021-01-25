class Song < ApplicationRecord
    validates :title, :artist_name, presence: true
    validates :released, inclusion: [true, false]
    validates :title, uniqueness: { scope: [:release_year, :artist_name], message: "songs must be unique each year"}
    validates :release_year, presence: true, if: :released
    validates :release_year, numericality: { less_than_or_equal_to: 2021 }, if: :released
end