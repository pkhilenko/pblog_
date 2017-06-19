class UsersController < ApplicationController
  before_action :setup_person_manager

  def index
    @users =  @person_manager.users.map { |id, user| user }
  end

  def new

  end

  def create
    @user = PersonManager.create_person(params[:email].values.first)
    @person_manager.add_person @user
    @person_manager.save_users
    redirect_to users_path, success: 'Вы успешно зарегистрировались'
  end

  def edit
    @user = @person_manager.users[params[:id].to_i]
  end

  def update
    @person_manager.person_edit(params[:id].to_i, params[:email].values.first)
    session[:user] = { 'id' => params[:id].to_i, 'user_name' => params[:email].values.first}
    redirect_to users_path, success: 'Пользователь успешно обнавлен'
  end

  def show
    @user = @person_manager.users[params[:id].to_i]
    # render html: @person_manager.users
  end

  def destroy
    @person_manager.person_delete params[:id].to_i
    session[:user] = nil
    redirect_to users_path, success: 'Пользователь успешно удален'
  end

  def setup_person_manager
    @person_manager = PersonManager.new(session)
  end

end
