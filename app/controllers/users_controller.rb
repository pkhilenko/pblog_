class UsersController < ApplicationController
  before_action :setup_person_manager, only: [:index, :edit, :update, :show, :destroy]

  def index
    @users =  @person_manager.users.each { |id, user| user['user_name'] } || nil
  end

  def new

  end

  def create
    @user = PersonManager.create_person(params[:email].values.first, session)
    redirect_to users_path, success: 'Вы успешно зарегистрировались'
  end

  def edit
    @user = @person_manager.users[params[:id].to_i]
  end

  def update
    @person_manager.person_edit(params[:id].to_i, params[:email].values.first)
    session[:user] = params[:email].values.first
    redirect_to users_path, success: 'Пользователь успешно обнавлен'
  end

  def show
    @user = @person_manager.users[params[:id].to_i]
  end

  def destroy
    @person_manager.person_delete params[:id]
    session[:user] = nil
    redirect_to users_path, success: 'Пользователь успешно удален'
  end

  def setup_person_manager
    @person_manager = PersonManager.new(session)
  end

end
