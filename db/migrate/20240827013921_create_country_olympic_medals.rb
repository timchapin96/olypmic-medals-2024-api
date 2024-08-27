class CreateCountryOlympicMedals < ActiveRecord::Migration[7.0]
  def change
    create_table :country_olympic_medals do |t|
      t.integer :rank
      t.string :country
      t.string :country_code
      t.integer :gold
      t.integer :silver
      t.integer :bronze
      t.integer :total

      t.timestamps
    end
    add_index :country_olympic_medals, :country_code
  end
end
