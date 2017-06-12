class UsersController < ApplicationController

  def index
    @users = PersonManager.users
  end

  def new

  end

  def create
    @user = Person.new(params[:email].values.first).user
    redirect_to users_path, success: 'Вы успешно зарегистрировались'
  end

  def edit
    @user = session[:user]
  end

  def update
    @user = { 'name' => params[:email].values.first, 'id' => session[:user]['id'] }
    PersonManager.edit @user
    redirect_to users_path
  end

  def show
    @user = { 'name' => PersonManager.users[params[:id].to_i], 'id' => params[:id] }
  end

  def destroy
    @user = { 'name' => session[:user]['name'], 'id' => session[:user]['id'] } if session[:user]
    PersonManager.destroy @user
    session[:user] = nil
    redirect_to users_path, success: 'Пользователь успешно удален'
  end

end
