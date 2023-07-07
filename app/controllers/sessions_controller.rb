class SessionsController < ApplicationController

  def new
  end

  def create
    user = User.find_by(email:params[:email])

    if user&.authenticate(params[:password])
      session[:user_id] = user.id 
      redirect_to session['previous_url'] || root_url
    else
      flash.now[:alert] = 'Are you a Guru? Verify your Email and Password please'
      render :new
    end
  end

  def destroy
    log_out
    redirect_to login_path
  end

private

  def log_out
    session.delete(:user_id)
    @current_user = nil
  end

end
