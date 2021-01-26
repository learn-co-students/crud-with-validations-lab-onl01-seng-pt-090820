class Song < ApplicationRecord
    validates :title, presence: true
    validates :title, uniqueness: { scope: [:artist_name, :release_year], message: "Title only allowed once per year per artist" }
    validates :released, inclusion: [true, false]
    validates :release_year, presence: false, if: :released
    validates :release_year, numericality: { less_than_or_equal_to: Date.today.year }, if: :released
    validates :artist_name, presence: true
end
