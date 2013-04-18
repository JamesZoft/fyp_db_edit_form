#require 'pry'

class TournamentEntryController < ApplicationController

  def new
    @tournamentEntry = TournamentEntry.new
  end
 
  def create
    #binding.pry
    @tournamentEntry = TournamentEntry.new(params[:tournament_entry])
    if @tournamentEntry.save
      redirect_to new_tournament_entry_path
    end
  end

end
