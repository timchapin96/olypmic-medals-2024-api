class Country < ApplicationRecord
  validates :rank, presence: true, numericality: { only_integer: true}
  validates :country, presence: true, uniqueness:true
  validates :country_code, presence: true, length: {maximum: 3}, uniqueness: true
  validates :gold, :silver, :bronze, :total, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validates :total, presence: true, numericality: true


  scope :by_country_code, ->(country_code) {where(country_code: country_code)}
  scope :by_rank, ->(rank) { where(rank: rank) }
  scope :by_sort_by, -> (field) { order(field) }
  scope :by_order, -> (direction) { order(created_at: direction) }

  scope :by_medal_type, ->(medal_type, count) { where("#{medal_type} >= ?", count) }
end
