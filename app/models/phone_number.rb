class PhoneNumber < ApplicationRecord
  MIN_NUMBER = 111_111_1111
  MAX_NUMBER = 999_999_9999

  validates :number,
            presence: true,
            uniqueness: true,
            numericality: { only_integer: true, greater_than_or_equal_to: MIN_NUMBER, less_than_or_equal_to: MAX_NUMBER }
end
