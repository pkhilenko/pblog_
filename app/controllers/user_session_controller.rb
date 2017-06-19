class UserSessionController < ApplicationController
  def new
  end

  def create
    @person_manager = PersonManager.new(session)
    if @person_manager.users.any? { |id, user| user.user_name == (params[:email].values.first)  }
      @person = @person_manager.users.values.select { |obj| obj.user_name == params[:email].values.first }.first
      session[:user] = @person
      redirect_to users_path, success: 'Вы успешно вошли на сайт'
    else
      render :new
    end
  end

  def destroy
    session[:user] = nil
    redirect_to users_path, success: 'Вы успешно вышли с сайта'
  end

end


