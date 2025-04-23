class Team < ApplicationRecord
    has_many :players, dependent: :nullify
    has_many :home_matches, class_name: 'Match', foreign_key: 'team1_id', dependent: :nullify
    has_many :away_matches, class_name: 'Match', foreign_key: 'team2_id', dependent: :nullify

    validates :name, presence: true, uniqueness: true
    validate :maximum_five_players
  
    def matches
      Match.where("team1_id = ? OR team2_id = ?", id, id)
    end

    def win_count
        matches.count { |match| match.winner == self }
    end

    def loss_count
        matches.count { |match| match.winner && match.winner != self }
    end

    def draw_count
        matches.count { |match| match.score_team1 && match.score_team2 && match.winner.nil? }
    end

    def points
        # 3 points pour une victoire, 1 pour un match nul
        (win_count * 3) + draw_count
    end

    private

    def maximum_five_players
        if players.size > 5
            errors.add(:base, "A team cannot have more than 5 players")
        end
    end
end
