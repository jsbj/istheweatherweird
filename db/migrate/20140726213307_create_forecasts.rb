class CreateForecasts < ActiveRecord::Migration
  def change
    create_table :forecasts do |t|
      t.integer :station_id
      t.date :date
      t.float :max
      t.float :min

      t.timestamps
    end
  end
end
