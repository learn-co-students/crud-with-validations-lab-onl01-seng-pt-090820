class Song < ApplicationRecord
    validates :title, presence: true
    validates :title, uniqueness: true
    validates :released, inclusion: { in: [true, false] }
    validates :release_year, presence: true, if: :is_released?
    validate :release_year_cannot_be_in_the_future
    
    

    def is_released?
        released == true
    end

    def release_year_cannot_be_in_the_future
        if release_year.present? && release_year > Date.today.year
            errors.add(:expiration_date, "can't be in the future")
          end
    end  

end
