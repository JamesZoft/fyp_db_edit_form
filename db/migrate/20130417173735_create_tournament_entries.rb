class CreateTournamentEntries < ActiveRecord::Migration
  def change
    create_table :tournament_entries do |t|
      t.string :entry_reqs
      t.string :format
      t.boolean :future
      t.boolean :past
      t.boolean :ongoing
      t.string :links
      t.string :location
      t.string :name
      t.string :prizes
      t.string :sponsor

      t.timestamps
    end
  end
end
