class CreateMatches < ActiveRecord::Migration[7.0]
  def change
    create_table :matches do |t|
      t.references :team1, null: false, foreign_key: { to_table: :teams }
      t.references :team2, null: false, foreign_key: { to_table: :teams }
      t.date :match_date
      t.integer :score_team1
      t.integer :score_team2

      t.timestamps
    end
  end
end
