class RenameSubDeviceIdRegId < ActiveRecord::Migration
  def change
    rename_column :subscriptions, :device_id, :device_registration_id
  end
end
