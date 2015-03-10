class CreateMetroStations < ActiveRecord::Migration
  def change
    create_table :metro_stations do |t|
      t.string    :station_code
      t.string    :station_name
      t.decimal   :longitude
      t.decimal   :latitude
      
      t.timestamps null: false
    end
  end
end
