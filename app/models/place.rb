class Place < ActiveRecord::Base
  CHICAGO = Place.where(name: "Chicago").first
  P_WEIRD = 0.05

  def stations
    StationPlace.where(place_id: id)
  end
  
  def max_forecast(date)
    23.4
  end
  
  def past(date)
    {
      years: [1990,1991,1992,1993],
      values: [30,22,24,25]
    }
  end
  
  def weird?(date)
    false
  end
end
