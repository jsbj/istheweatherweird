class Place < ActiveRecord::Base
  CHICAGO = Place.where(name: "Chicago").first
  P_WEIRD = 0.05

  def stations
    StationPlace.where(place_id: id)
  end
  
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
