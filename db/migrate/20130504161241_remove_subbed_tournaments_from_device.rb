class RemoveSubbedTournamentsFromDevice < ActiveRecord::Migration
  def change
    remove_column :gcm_devices, :subbedTournaments
  end
end
