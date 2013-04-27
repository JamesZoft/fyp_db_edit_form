class TournamentEntryController < ApplicationController

  def new
    @tournamentEntry = TournamentEntry.new
  end
 
  def create
    @tournamentEntry = TournamentEntry.new(params[:tournament_entry])
    if @tournamentEntry.save
      redirect_to new_tournament_entry_path
    end
  end
  
    
  def edit
    @tournamentEntry = TournamentEntry.find(params[:id])
  end
  
  def update
		@tournamentEntry = TournamentEntry.find(params[:id])
		if @tournamentEntry.update_attributes(params[:tournament_entry])
		  redirect_to(@tournamentEntry)
		else
		  render :edit
		end
  end
  
  def show
    @tournamentEntry = TournamentEntry.find(params[:id])
  end

end
