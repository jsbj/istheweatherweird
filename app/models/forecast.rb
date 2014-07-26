require 'open-uri'

class Forecast < ActiveRecord::Base
  
  # find or create a record for Chicago, today, with forecasted 
  def self.update_max_and_min
    Place.all.each do |place|
      station = place.stations.first # do |station|
        # get the date
        date = Date.today
    
        # get the forecast
        xml = Nokogiri::XML(open("http://forecast.weather.gov/MapClick.php?lat=#{station.latitude}&lon=#{station.longitude}&unit=0&lg=english&FcstType=dwml"))
        max = xml.css("temperature[type='maximum'] value")[0].text.to_f
        min = xml.css("temperature[type='minimum'] value")[0].text.to_f
        forecast = self.where(wban: station.wban, usaf: station.usaf, date: date).first
        forecast ||= self.new(wban: station.wban, usaf: station.usaf, date: date)
        forecast.update(max: max, min: min)
        # end
    end
  end
end