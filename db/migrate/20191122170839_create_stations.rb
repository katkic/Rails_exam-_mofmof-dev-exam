class CreateStations < ActiveRecord::Migration[5.0]
  def change
    create_table :stations do |t|
      t.string :name, null: false
      t.string :route, null: false
      t.integer :walking_minutes, null: false
      t.integer :number
      t.references :apartment, foreign_key: true

      t.timestamps
    end
  end
end
