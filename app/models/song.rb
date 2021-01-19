class Song < ApplicationRecord
    validates :title, presence: true
    validate :title_not_repeated_by_artist
    validates :released, inclusion: [true, false]
    validates :release_year, presence: true, if: :released?
    validate :release_year_not_in_future, if: :released?
    validates :artist_name, presence: true

    def released?
        !!self.released
    end

    def release_year_not_in_future
        if self.release_year && self.release_year > Time.now.year
           errors.add(:release_year, "can't be in the future")
        end
    end

    def title_not_repeated_by_artist
        if !Song.where(artist_name: self.artist_name, title: self.title, release_year: self.release_year).empty?
            errors.add(:title, "cannot be repeated by the same artist in the same year")
        end
    end
end