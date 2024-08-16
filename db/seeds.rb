require 'csv'

CSV.foreach('db/olympics2024.csv', headers: true) do |row|
  Country.create(
    rank: row['rank'],
    country: row['country'],
    country_code: row['country_code'],
    gold: row['gold'],
    silver: row['silver'],
    bronze: row['bronze'],
    total: row['total']
  )
end
