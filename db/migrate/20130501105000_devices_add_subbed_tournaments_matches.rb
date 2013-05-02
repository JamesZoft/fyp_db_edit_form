class DevicesAddSubbedTournamentsMatches < ActiveRecord::Migration
  def change
    add_column :gcm_devices, :subbedTournaments, :string
    add_column :gcm_devices, :subbedMatches, :string
  end
end
