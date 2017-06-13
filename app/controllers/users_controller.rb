class UsersController < ApplicationController

  def index
    @users = PersonManager.users.each { |id, user| user.user_name }
  end

  def new

  end

  def create
    @user = PersonManager.create_person(params[:email].values.first)
    redirect_to users_path, success: 'Вы успешно зарегистрировались'
  end

  def edit
    @user = PersonManager.new
    @user = @user.users[params[:id].to_i]
  end

  def update
    @user = PersonManager.new
    @user.person_edit(params[:id].to_i, params[:email].values.first)
    session[:user] = params[:email].values.first
    redirect_to users_path, success: 'Пользователь успешно обнавлен'
  end

  def show
    @user = PersonManager.new
    @user = @user.users[params[:id].to_i].user_name
  end

  def destroy
    @user = { 'name' => session[:user]['name'], 'id' => session[:user]['id'] } if session[:user]
    @persons = PersonManager.new
    @persons.person_delete params[:id].to_i
    session[:user] = nil
    redirect_to users_path, success: 'Пользователь успешно удален'
  end

end
