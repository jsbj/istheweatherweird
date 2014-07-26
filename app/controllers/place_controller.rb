class PlaceController < ApplicationController
  def show
    @date = Date.today
    @place = Place::CHICAGO
    gon.past = @place.past(@date)
    gon.max_forecast = @place.max_forecast(@date)
    @weird = @place.weird?(@date)
  end
end
