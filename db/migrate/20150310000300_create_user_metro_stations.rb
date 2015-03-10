class CreateUserMetroStations < ActiveRecord::Migration
  def change
    create_table :user_metro_stations do |t|
      t.belongs_to :user, index: true
      t.belongs_to :metro_station, index: true

      t.timestamps null: false
    end
    add_foreign_key :user_metro_stations, :users
    add_foreign_key :user_metro_stations, :metro_stations
  end
end
