require 'open-uri'

class Forecast < ActiveRecord::Base
  
  # find or create a record for Chicago, today, with forecasted 
  def self.update_max_and_min
    # get the date
    date = Date.today
    
    # get the forecast
    xml = Nokogiri::XML(open("http://forecast.weather.gov/MapClick.php?lat=41.83700&lon=-87.685&unit=0&lg=english&FcstType=dwml"))
    max = (xml.css("temperature[type='maximum'] value")[0].text.to_f - 32) / 1.8
    min = (xml.css("temperature[type='minimum'] value")[0].text.to_f - 32) / 1.8
    forecast = self.where(date: date).first
    forecast ||= self.new(date: date)
    forecast.update(max: max, min: min)
  end
end
