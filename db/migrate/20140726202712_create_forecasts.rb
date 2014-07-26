class CreateForecasts < ActiveRecord::Migration
  def change
    create_table :forecasts do |t|
      t.integer :station_id
      t.float :max
      t.float :min
      t.date :date

      t.timestamps
    end
  end
end
