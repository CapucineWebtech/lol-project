class AddMissingFields < ActiveRecord::Migration[7.1]
  def change
    unless column_exists?(:matches, :match_date)
      add_column :matches, :match_date, :datetime
    end

    unless column_exists?(:matches, :score_team1)
      add_column :matches, :score_team1, :integer
    end

    unless column_exists?(:matches, :score_team2)
      add_column :matches, :score_team2, :integer
    end

    # Ajouter is_admin aux users si pas présent
    unless column_exists?(:users, :is_admin)
      add_column :users, :is_admin, :boolean, default: false
    end

    unless column_exists?(:players, :role)
      add_column :players, :role, :string
    end
  end
end
