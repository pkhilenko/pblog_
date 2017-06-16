class UsersController < ApplicationController
  before_action :setup_person_manager, only: [:index, :edit, :update, :show, :destroy]

  def index
    @users =  @person_manager.users.map { |id, user| user }
  end

  def new

  end

  def create
    @user = PersonManager.create_person(params[:email].values.first, session)
    redirect_to users_path, success: 'Вы успешно зарегистрировались'
  end

  def edit
    @user = @person_manager.users[params[:id]]
  end

  def update
    @person_manager.person_edit(params[:id], params[:email].values.first)
    session[:user] = { 'id' => params[:id].to_i, 'user_name' => params[:email].values.first}
    redirect_to users_path, success: 'Пользователь успешно обнавлен'
  end

  def show
    @user = @person_manager.users[params[:id]]
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
