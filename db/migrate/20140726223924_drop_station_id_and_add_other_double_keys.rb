class DropStationIdAndAddOtherDoubleKeys < ActiveRecord::Migration
  def change
    remove_column :forecasts, :station_id
    add_column :forecasts, :wban, :int
    add_column :forecasts, :usaf, :string
  end
end