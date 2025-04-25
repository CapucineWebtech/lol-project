class Player < ApplicationRecord
  belongs_to :team

  VALID_ROLES = ['Top laner', 'Jungler', 'Mid laner', 'ADC', 'Support']

  validates :first_name, presence: { message: "Le prénom est obligatoire" }
  validates :last_name, presence: { message: "Le nom est obligatoire" }
  validates :role,
            presence: { message: "Le rôle est obligatoire" },
            inclusion: {
              in: VALID_ROLES,
              message: "Le rôle doit être l’un des suivants : #{VALID_ROLES.join(', ')}"
            }

  validates :team_id, presence: { message: "L’équipe doit être sélectionnée" }
  validate :team_must_have_slots

  def full_name
    "#{first_name} #{last_name}"
  end

  def matches
    team&.matches || []
  end

  def scores
    return [] unless team
    team.matches.map do |match|
      match.team1_id == team.id ? match.score_team1 : match.score_team2
    end.compact
  end

  def win_count
    return 0 unless team
    team.matches.count { |match| match.winner == team }
  end

  private

  def team_must_have_slots
    return unless team

    if team.players.count >= 5 && (new_record? || team_id_changed?)
      errors.add(:team_id, "Cette équipe a déjà 5 joueurs")
    end
  end
end
