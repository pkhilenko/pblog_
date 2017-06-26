class PersonsController < ApplicationController
  before_action :setup_person_manager
  before_action :set_person, only: [:show, :edit, :update, :destroy]

  def index
  end

  def new
  end

  def create
    @person = @person_factory.create_person(params[:name], params[:email], params[:date_of_birth], params[:salary])
    @person_manager.set_person @person
    @person_manager.save_persons
    redirect_to persons_path, success: 'Вы успешно зарегистрировались'
  end

  def show
  end

  def edit
  end

  def update
    @person.name = params[:name]
    @person.email = params[:email]
    @person.date_of_birth = params[:date_of_birth]
    @person.salary = params[:salary]
    @person_manager.set_person(@person)
    @person_manager.save_persons
    redirect_to persons_path, success: 'Пользователь успешно обнавлен'
  end

  def destroy
    @person_manager.remove_person(@person)
    @person_manager.save_persons
    redirect_to persons_path, success: 'Пользователь успешно удален'
  end

  def setup_person_manager
    @person_manager = PersonManager.new(PersonSessionStore.new(session))
    @person_factory = PersonFactory.new(@person_manager.max_id)
  end

  def set_person
    @person = @person_manager.get_person(params[:id])
  end
end
