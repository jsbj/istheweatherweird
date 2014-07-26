class RenameJoinTable < ActiveRecord::Migration
  def change
    rename_table :places_stations, :place_stations
  end
end