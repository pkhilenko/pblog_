class UserSessionController < ApplicationController
  def new
  end

  def create
    if PersonManager.users.has_value?(params[:email].values.first)
      @user = PersonManager.users.select { |id, name| name == params[:email].values.first }
      @user = { 'name' => @user.values.first, 'id' => @user.keys.first }
      session[:user] = @user
      redirect_to users_path
    end
  end

  def destroy
    session[:user] = nil
    redirect_to users_path
  end

end


