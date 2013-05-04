class CreateSubscriptions < ActiveRecord::Migration
  def change
    create_table :subscriptions do |t|
      t.belongs_to :tournament_entry
      t.belongs_to :device
      t.belongs_to :match_entry

      t.timestamps
    end
    add_index :subscriptions, :tournament_entry_id
    add_index :subscriptions, :device_id
    add_index :subscriptions, :match_entry_id
  end
end
