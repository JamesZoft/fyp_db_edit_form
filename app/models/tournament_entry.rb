class TournamentEntry < ActiveRecord::Base
  attr_accessible :entry_reqs, :format, :future, :links, :location, :name, :ongoing, :past, :prizes, :sponsor
  
  def status
    if(:future == "true") then
      return "future"
    elsif(:past == "true") then
      return "past"
    elsif(:ongoing == "true") then
      return "ongoing"
    end
  end
  
end