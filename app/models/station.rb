class Station < ActiveRecord::Base
  def self.chicago
    Station.where(wban: "14819", usaf: "725340").first
  end
  
  def self.update
    self.chicago
  end

  def gsods(date)
    GSOD.where(wban: self.wban, stn: self.usaf, 
			   month: date.month, day: date.day)
  end
end
