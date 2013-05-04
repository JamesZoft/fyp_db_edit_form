class ChangeDeviceIdFromIntToString < ActiveRecord::Migration
  def change
    change_column :subscriptions, :device_id, :string
  end
end
