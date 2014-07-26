class Station < ActiveRecord::Base
  def self.chicago
    Station.where(wban: "14819", usaf: "725340").first
  end
  
  def self.update
    self.chicago
  end
end
