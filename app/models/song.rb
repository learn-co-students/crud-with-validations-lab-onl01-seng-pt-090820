class Song < ApplicationRecord
    validates :title, :artist_name, presence: true
    validates :title, uniqueness: {scope: [:artist_name, :release_year]}
    validates :released, inclusion: [true, false]
    validates :release_year, presence: true, if: :released
    validates :release_year, numericality: { less_than_or_equal_to: Date.today.year }, if: :released
    # validate :release_year_cannot_be_in_future

    # def released?
    #     released == true
    # end

    # def release_year_cannot_be_in_future
    #     if release_year.present? && release_year > Date.today.year
    #         errors.add(:release_year, "can't be in the future")
    #     end
    # end

end
