class Match < ApplicationRecord
  belongs_to :team1, class_name: 'Team'
  belongs_to :team2, class_name: 'Team'

  validates :match_date, presence: true
  validates :team1_id, presence: true
  validates :team2_id, presence: true
  validate :teams_must_be_different
  validate :teams_must_have_players

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
      "Not played yet"
    end
  end

  def result_text
    return "Match not plated yet" if score_team1.nil? || score_team2.nil?
    winner_team = winner
    if winner_team
      "#{winner_team.name} won (#{score_team1} - #{score_team2})"
    else
      "Draw (#{score_team1} - #{score_team2})"
    end
  end

  private

  def teams_must_be_different
    if team1_id == team2_id
      errors.add(:team2_id, "cannot be the same as Team 1")
    end
  end

  def teams_must_have_players
    if team1 && team1.players.empty?
      errors.add(:team1_id, "must have at least one player")
    end

    if team2 && team2.players.empty?
      errors.add(:team2_id, "must have at least one player")
    end
  end
end
