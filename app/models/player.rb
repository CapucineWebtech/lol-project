class Player < ApplicationRecord
  belongs_to :team, optional: true

  def matches
    team&.matches
  end

  def scores
    return [] unless team
    team.matches.map do |match|
      if match.team1_id == team.id
        match.score_team1
      else
        match.score_team2
      end
    end
  end
end
