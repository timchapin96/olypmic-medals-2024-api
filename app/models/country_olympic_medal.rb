class CountryOlympicMedal < ApplicationRecord
  validates :rank, presence: true, numericality: { only_integer: true}
  validates :country, presence: true, uniqueness:true
  validates :country_code, presence: true, length: {maximum: 3}, uniqueness: true
  validates :gold, :silver, :bronze, :total, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validates :total, presence: true, numericality: true

  #TODO
  #Figure out a more elegent way to include order scope into the other


  # These two are not RESTful
  # #SELECT * FROM countries WHERE country_code IN (["country_code"], ......)
  # scope :by_country_codes, ->(country_codes) do
  #   if country_codes.is_a?(String)
  #     country_codes = JSON.parse(country_codes)
  #   end
  #   where(country_code: country_codes)
  # end

  # #SELECT * FROM countries WHERE rank = params[rank]
  # scope :by_ranks, ->(ranks) do
  #   if ranks.is_a?(String)
  #     ranks = JSON.parse(ranks)
  #   end
  #   where(rank: ranks)
  # end

  #SELECT * FROM countries ORDER BY params[field]
  scope :by_sort_by, -> (field) { order(field) }
  #SELECT * FROM countries ORDER BY created_at
  scope :by_order, -> (direction) { order(created_at: direction) }
  #SELECT * FROM countries LIMIT = params[limit]
  scope :by_limit, -> (limit) { limit(limit)}

  #SELECT * FROM countries WHERE medal_type >= count
  scope :by_medal_type, ->(medal_type, count) { where("#{medal_type} >= ?", count) }
end
