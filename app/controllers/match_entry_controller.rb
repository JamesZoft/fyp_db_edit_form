class MatchEntryController < ApplicationController
before_filter :authenticate_user!

  def new
    @matchEntry = MatchEntry.new
  end

  def create
    @matchEntry = MatchEntry.new(params[:match_entry])
    if @matchEntry.save
      redirect_to new_match_entry_path
    end
  end
  
  def edit
    @matchEntry = MatchEntry.find(params[:id])
  end
  
  def update
    #need subbedtournaments subbedmatches in gcm_devices table, when change made, for each device that has subbed x which has same id as changed x id, add notif, when done, send all notifs
    
		@matchEntry = MatchEntry.find(params[:id])
		if @matchEntry.update_attributes(params[:match_entry])
		  redirect_to(@matchEntry)
		  subscriptions = Subscription.all
		  Rails.logger.debug("matchentry id: #{@matchEntry.id}")
		  subscriptions.each do |subscription| 
		    Rails.logger.debug("subscription: #{subscription.inspect}")
		    if(subscription != nil and subscription.match_entry != nil)
#                    Rails.logger.debug(subscription.match_entry.id)
                    Rails.logger.debug("asd")
  #                  Rails.logger.debug(@matchEntry.id)
	        if(subscription.match_entry.id == @matchEntry.id)
		  Rails.logger.debug("inside == ")
                  
	          new_notification = Gcm::Notification.new
	          new_notification.device = subscription.device
	          new_notification.collapse_key = "new_match_data_available"
	          new_notification.delay_while_idle = true
	          new_notification.data = {:registration_ids => [subscription.device.registration_id], :data => {:message_text => @matchEntry}}
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
    @matchEntry = MatchEntry.find(params[:id])
  end

end
