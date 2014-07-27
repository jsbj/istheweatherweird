class Place < ActiveRecord::Base
  CHICAGO = Place.where(name: "Chicago").first
  
  def stations
    PlaceStation.where(place_id: id).map {|ps| Station.where(wban: ps.station_wban, usaf: ps.station_usaf).first}
  end
  
  def max_forecast(date)
    forecast = Forecast.where(wban: stations.first.wban, usaf: stations.first.usaf, date: date).first
    forecast.max
  end
  
  def past(date)
    gsods = stations.first.gsods(date)

    gsods.map do |gsod|
      {
        year: gsod.year,
        max: gsod.max
      }
    end
  end
  
  def weird?(date)
    false
  end
end
