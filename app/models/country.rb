class Country < ApplicationRecord
  validates :rank, presence: true, numericality: { only_integer: true}
  validates :country, presence: true, uniqueness: true
  validates :country_code, presence: true, length: {maximum: 3}, uniquness: true
  validates :gold, :silver, :bronze, :total, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validates :total, presence: true, numericality: true
end
