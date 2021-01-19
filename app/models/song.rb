class Song < ActiveRecord::Base
    validates :title, presence: true, uniqueness: {scope: :release_year, message: "can only happen once per year"}
    validates :artist_name, presence: true
    validates :release_year, presence: true, if: :release_year_current?

    def release_year_current?
    end
end
