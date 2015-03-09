class CreateUserBikeStations < ActiveRecord::Migration
  def change
    create_table :user_bike_stations do |t|
      t.belongs_to :user, index: true
      t.string :location

      t.timestamps null: false
    end
    add_foreign_key :user_bike_stations, :users
  end
end
