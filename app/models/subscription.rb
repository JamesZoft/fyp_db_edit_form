class Subscription < ActiveRecord::Base
  validates_presence_of :device_id
  validates_uniqueness_of :device_id
  belongs_to :tournament_entry, :class_name => "TournamentEntry", :foreign_key => "tournament_entries_id"
  belongs_to :device, :class_name => "Gcm::Device", :foreign_key => "gcm_devices_id"
  belongs_to :match_entry, :class_name => "MatchEntry", :foreign_key => "match_entries_id"
  attr_accessible :tournament_entry_id, :device_id, :match_entry_id
end
