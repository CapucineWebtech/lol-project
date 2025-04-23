class Team < ApplicationRecord
    has_many :players, dependent: :nullify
    has_many :home_matches, class_name: 'Match', foreign_key: 'team1_id', dependent: :nullify
    has_many :away_matches, class_name: 'Match', foreign_key: 'team2_id', dependent: :nullify
  
    def matches
      Match.where("team1_id = ? OR team2_id = ?", id, id)
    end
end
