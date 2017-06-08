class UsersController < ApplicationController
  attr_reader :user

  def new
  end

  def create
    @user = params[:email]
    session[:user] =  @user
    redirect_to root_path
  end

  def destroy
    @users = nil
    session[:user] = nil
    redirect_to root_path
  end

end
