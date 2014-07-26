class Station < ActiveRecord::Base
  CHICAGO = Station.where(wban: "14819").first
  
  def gsods(date)
    GSOD.where(wban: self.wban, month: date.month, day: date.day)
  end
end
