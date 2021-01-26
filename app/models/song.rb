class Song < ApplicationRecord
    validates :title, presence: true
    validates :artist_name, presence: true
    validates :title, uniqueness: { scope: [:release_year, :artist_name], message: "should happen once per year per artist" }
    validates :release_year, presence: true, if: :released
    validates :released, inclusion: [true, false]
    validates :release_year, numericality: { less_than_or_equal_to: Date.today.year }, if: :released
end
