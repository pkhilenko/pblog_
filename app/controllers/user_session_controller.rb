class UserSessionController < ApplicationController
  def new
  end

  def create
    if PersonManager.users.any? { |id, user| user.user_name == (params[:email].values.first)  }
      session[:user] = params[:email].values.first
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


