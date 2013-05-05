class TournamentEntryController < ApplicationController
before_filter :authenticate_user!
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
		  subscriptions = Subscription.all
		  subscriptions.each do |subscription| 
		    if(subscription != nil and subscription.match_entry 
!= nil)
	        if(subscription.tournament_entry.id == @tournamentEntry.id)
	          new_notification = Gcm::Notification.new
	          new_notification.device = subscription.device
	          new_notification.collapse_key = "new_tournament_data_available"
	          new_notification.delay_while_idle = true
	          new_notification.data = {:registration_ids => [subscription.device.registration_id], :data => {:message_text => @tournamentEntry}}
	          new_notification.save
	        end
	      end
	    end
	    Gcm::Notification.send_notifications
		else
		  render :edit
		end
  end
  
  def show
    @tournamentEntry = TournamentEntry.find(params[:id])
  end

end
