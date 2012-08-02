class SessionsController < ApplicationController

  def create
    @user         = User.find_or_create_from_auth_hash(auth_hash)
    @user_name    = @user.display_name

    session[:current_user_id] = @user.id
    redirect_to :root
  end

  def destroy
    @current_user = nil
    session[:current_user_id] = nil
    redirect_to :root
  end

  protected

  def auth_hash
    request.env['omniauth.auth']
  end
end