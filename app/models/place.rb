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
	today = forecast(date)
	hist = past(date)

    maxs = hist.map {|x| x[:max]}
    p_max = maxs.select{ |x| x <= today.max }.size / Float(hist.size)
    
    mins = hist.map {|x| x[:min]}
    p_min = mins.select{ |x| x <= today.min }.size / Float(hist.size)
	
	(p_max > 1 - P) or (p_max < P) or (p_min > 1 - P) or (p_min < P)
  end
end
