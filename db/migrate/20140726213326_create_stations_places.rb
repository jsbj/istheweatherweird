class CreateStationsPlaces < ActiveRecord::Migration
  def change
    create_table :places_stations, id: false do |t|
      t.integer :place_id
      t.integer :station_wban
	  t.string  :station_usaf
    end
  end
end
