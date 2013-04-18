class MatchEntryController < ApplicationController

  def new
    @matchEntry = MatchEntry.new
  end

  def create
    @matchEntry = MatchEntry.new(params[:match_entry])
    if matchEntry.save
      redirect_to new_matchEntry_path
    end
  end

end
