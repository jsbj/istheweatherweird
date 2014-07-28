require 'mixpanel-ruby'

class PlaceController < ApplicationController
  def show
    @date = Time.use_zone("America/Chicago") { Time.zone.now.to_date }
    @place = Place::CHICAGO
    gon.past = @place.past(@date)
    forecast = @place.forecast(@date)
    gon.forecast = {
      min: forecast.min,
      max: forecast.max
    }
    @weird = @place.weird?(@date)

	if Rails.env.production?
		tracker = Mixpanel::Tracker.new("73d5b1f1bee48b4fcc119119c45f45c5")
	  	tracker.track(0,"Main page")
	end
  end
end
