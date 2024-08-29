class CountryOlympicMedal < ApplicationRecord
  validates :rank, presence: true, numericality: { only_integer: true}
  validates :country, presence: true, uniqueness:true
  validates :country_code, presence: true, length: {maximum: 3}, uniqueness: true
  validates :gold, :silver, :bronze, :total, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validates :total, presence: true, numericality: true

  #TODO
  #Figure out a more elegent way to include order scope into the other

  #SELECT * FROM country_olympic_medal WHERE country_code = country_codes
  scope :by_country_codes, -> (country_codes) {where(country_code: country_codes.split(','))}
  #SELECT * FROM country_olympic_medal ORDER BY params[field]
  scope :by_sort_by, -> (field) { order(field) }
  #SELECT * FROM country_olympic_medal LIMIT = params[limit]
  scope :by_limit, -> (limit) { limit(limit)}

  #SELECT * FROM country_olympic_medal WHERE medal_type > count and < count
  scope :by_min_medal_count_of_type, -> (medal_type, greater_than) { where("#{medal_type} > ?", greater_than) }
  scope :by_max_medal_count_of_type, -> (medal_type, less_than) { where("#{medal_type} < ?", less_than) }
  scope :by_between_medal_count_of_type, -> (medal_type, greater_than, less_than) {
      where("#{medal_type} BETWEEN ? AND ?", greater_than, less_than)
  }

  #SELECT * FROM country_olypmic_medal WHERE total > count and < count
  scope :by_min_total_medal_count, -> (medal_total_min) { where("total >= ?", medal_total_min) }
  scope :by_max_total_medal_count, -> (medal_total_max) { where("total <= ?", medal_total_max) }
  scope :by_between_total_medal_count, -> (medal_total_min, medal_total_max) {
    where("total BETWEEN ? AND ?", medal_total_min, medal_total_max)
  }

end
