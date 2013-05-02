class DevicesRemoveSubbedTournamentsMatches < ActiveRecord::Migration
  def change
    remove_column :gcm_devices, :subbedMatches
  end
end
