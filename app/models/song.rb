class Song < ActiveRecord::Base
    validates :title, presence: true, uniqueness: {scope: [:release_year, :artist_name], message: "can only happen once per year"}
    validates :artist_name, presence: true
    validates :released, inclusion: [true, false]
    validates :release_year, presence: true, if: :released
    validates :release_year, numericality: {less_than_or_equal_to: 2021}, if: :released
end
