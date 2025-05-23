class SessionsController < ApplicationController
  def new
    redirect_to current_user if logged_in?
  end  

  def create
    user = User.find_by(email: params[:email])
    if user&.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to root_path, notice: 'Connexion réussie'
    else
      flash.now[:alert] = 'Email ou mot de passe incorrect'
      render :new, status: :unprocessable_entity
    end
  end
  

  def destroy
    session.delete(:user_id)
    redirect_to root_path, notice: 'Déconnexion réussie'
  end
end
