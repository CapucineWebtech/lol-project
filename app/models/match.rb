class Match < ApplicationRecord
  belongs_to :team1, class_name: 'Team'
  belongs_to :team2, class_name: 'Team'

  validates :match_date, presence: true
  validates :team1_id, presence: true
  validates :team2_id, presence: true
  validate :teams_must_be_different
  validate :teams_must_have_players

  def played?
    score_team1.present? && score_team2.present?
  end

  def winner
    return nil if score_team1.nil? || score_team2.nil?
    if score_team1 > score_team2
      team1
    elsif score_team2 > score_team1
      team2
    else
      nil
    end
  end

  def score
    if score_team1.present? && score_team2.present?
      "#{score_team1} - #{score_team2}"
    else
      "Pas encore joué"
    end
  end

  def result_text
    return "Match pas encore joué" if score_team1.nil? || score_team2.nil?
    winner_team = winner
    if winner_team
      "#{winner_team.name} a gagné (#{score_team1} - #{score_team2})"
    else
      "Égalité (#{score_team1} - #{score_team2})"
    end
  end

  private

  def teams_must_be_different
    if team1_id == team2_id
      errors.add(:team2_id, "ne peut pas être la même que l'équipe 1")
    end
  end

  def teams_must_have_players
    if team1 && team1.players.empty?
      errors.add(:team1_id, "doit avoir au moins un joueur")
    end

    if team2 && team2.players.empty?
      errors.add(:team2_id, "doit avoir au moins un joueur")
    end
  end
end
