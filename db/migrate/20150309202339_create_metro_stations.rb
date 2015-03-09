class CreateMetroStations < ActiveRecord::Migration
  def change
    create_table :metro_stations do |t|
      t.string    :station_code
      t.string    :station_name
      t.integer   :longitude
      t.integer   :latitude
      
      t.timestamps null: false
    end
  end
end
