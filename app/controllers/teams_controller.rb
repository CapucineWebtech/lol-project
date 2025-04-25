class TeamsController < ApplicationController
  before_action :require_login
  before_action :require_admin, only: %i[new create edit update destroy]
  before_action :set_team, only: %i[show edit update destroy]

  def index
    @teams = Team.all
  end

  def show
  end

  def new
    @team = Team.new
  end

  def edit
  end

  def create
    @team = Team.new(name: team_params[:name])
    
    respond_to do |format|
      if @team.save
        player_ids = params[:team][:player_ids].reject(&:blank?)
        if player_ids.any?
          Player.where(id: player_ids).update_all(team_id: @team.id)
        end
        format.html { redirect_to @team, notice: "Équipe créée avec succès." }
      else
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @team.update(name: team_params[:name])        
        player_ids = params[:team][:player_ids].reject(&:blank?)
        if player_ids.any?
          Player.where(id: player_ids).update_all(team_id: @team.id)
        end
        
        format.html { redirect_to @team, notice: "Équipe mise à jour avec succès." }
      else
        format.html { render :edit, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    if @team.players.exists?
      redirect_to edit_team_path(@team), alert: "Merci de retirer tous les joueurs de l'équipe avant de la supprimer."
    else
      @team.destroy!
      redirect_to teams_path, status: :see_other, notice: "Équipe supprimée avec succès."
    end
  end
  

  private

  def set_team
    @team = Team.find(params[:id])
  end

  def team_params
    params.require(:team).permit(:name, player_ids: [])
  end

  def assign_players
    new_ids = params[:team][:player_ids].reject(&:blank?).map(&:to_i)
  
    @team.players.where.not(id: new_ids).each do |player|
      player.update(team_id: nil)
    end
  
    Player.where(id: new_ids).each do |player|
      player.update(team_id: @team.id)
    end
  end  
end
