class CreateCountries < ActiveRecord::Migration[7.0]
  def change
    create_table :countries do |t|
      t.integer :rank
      t.string :country
      t.string :country_code
      t.integer :gold
      t.integer :silver
      t.integer :bronze
      t.integer :total

      t.timestamps
    end
    add_index :countries, :country_code
  end
end
