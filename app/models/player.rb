class Player < ApplicationRecord
  belongs_to :team, optional: true

  VALID_ROLES = ['Top laner', 'Jungler', 'Mid laner', 'ADC', 'Support']

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :role, presence: true, inclusion: { in: VALID_ROLES,
                                                message: "must be one of: #{VALID_ROLES.join(', ')}" }

  def full_name
    "#{first_name} #{last_name}"
  end

  def matches
    team&.matches || []
  end

  def scores
    return [] unless team
    team.matches.map do |match|
      if match.team1_id == team.id
        match.score_team1
      else
        match.score_team2
      end
    end.compact
  end

  def win_count
    return 0 unless team
    team.matches.count { |match| match.winner == team }
  end
end
