class Place < ActiveRecord::Base
  CHICAGO = Place.new(name: "Chicago")
  
  def max_forecast(date)
    forecast = Forecast.where(station_id: Station::CHICAGO.id, date: date).first
    forecast.max
  end
  
  def past(date)
    gsods = Station::CHICAGO.gsods

    {
      years: gsods.map(&:year),
      maxs: gsods.map(&:max)
    }
  end
  
  def weird?(date)
    false
  end
end
