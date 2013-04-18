class CreateMatchEntries < ActiveRecord::Migration
  def change
    create_table :match_entries do |t|
      t.date :date
      t.string :links
      t.string :parentTournament
      t.string :player1
      t.string :player2
      t.string :status
      t.time :time

      t.timestamps
    end
  end
end
