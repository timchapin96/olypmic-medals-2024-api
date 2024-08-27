require 'csv'

CSV.foreach('db/olympics2024.csv', headers: true) do |row|
  p row['Country Code']
  CountryOlympicMedal.create!(
    rank: row['Rank'],
    country: row['Country'],
    country_code: row['Country Code'],
    gold: row['Gold'],
    silver: row['Silver'],
    bronze: row['Bronze'],
    total: row['Total']
  )
end
