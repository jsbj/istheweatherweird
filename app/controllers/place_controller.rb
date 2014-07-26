class PlaceController < ApplicationController
  def show
    @date = Date.today
    @maxs = Place::CHICAGO.past(@date)[:values]
    @max_forecast = Place::CHICAGO.max_forecast(@date)
    @weird = Place::CHICAGO.weird?(@date)
  end
end
