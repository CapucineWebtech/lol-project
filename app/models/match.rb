class Match < ApplicationRecord
  belongs_to :team1, class_name: 'Team'
  belongs_to :team2, class_name: 'Team'

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
end
