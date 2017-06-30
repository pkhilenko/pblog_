class PetrablogController < ApplicationController
  before_action :setup_person_manager
  before_action :set_person, only: [:show, :edit, :update, :destroy]
  def index
  end

  def show
  end

  private
  def setup_person_manager
    @person_manager = PersonManager.new(PersonJsonApiStore.new)
    @person_factory = PersonFactory.new(@person_manager.max_id)
  end

  def set_person
    @person = @person_manager.get_person(params[:id].to_i)
  end
end
