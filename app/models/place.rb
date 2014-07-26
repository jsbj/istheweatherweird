class Place < ActiveRecord::Base
  CHICAGO = Place.new(name: "Chicago")
  
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
