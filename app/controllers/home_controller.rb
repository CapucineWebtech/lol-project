class HomeController < ApplicationController
  def index
    @recent_matches = Match.order(match_date: :desc).limit(5)
    @teams = Team.all.sort_by(&:points).reverse
  end
end
