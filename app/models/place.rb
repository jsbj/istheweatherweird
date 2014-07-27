class Place < ActiveRecord::Base
  CHICAGO = Place.where(name: "Chicago").first
  P = 0.10
  
  def stations
    PlaceStation.where(place_id: id).map {|ps| Station.where(wban: ps.station_wban, usaf: ps.station_usaf).first}
  end
  
  def forecast(date)
    forecast = Forecast.where(wban: stations.first.wban, usaf: stations.first.usaf, date: date).first
    
    if !forecast
      Forecast.update_max_and_min
      
      forecast = Forecast.where(wban: stations.first.wban, usaf: stations.first.usaf, date: date).first
    end
    
    forecast
  end
  
  def past(date)
    gsods = stations.first.gsods(date)

    gsods.map do |gsod|
      {
        year: gsod.year,
        max: gsod.max,
        min: gsod.min
      }
    end
  end
  
  def weird?(date)
    today = forecast(date).max
    hist = past(date).map {|x| x[:max]}
    p = hist.select{ |x| x <= today }.size / Float(hist.size)
    (p > 1 - P) or (p < P)
  end
end
