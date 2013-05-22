class AddPolymorphicAssociationToSubs < ActiveRecord::Migration
  def change
    remove_column :subscriptions, :match_entry_id
    remove_column :subscriptions, :tournament_entry_id
    add_column :subscriptions, :model_id, :integer
    add_column :subscriptions, :model_type, :string
  end
end
