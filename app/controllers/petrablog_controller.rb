class PetrablogController < ApplicationController
  before_action :setup_person_manager
  def index
     render 'persons/index'
  end

  def setup_person_manager
    @person_manager = PersonManager.new(PersonJsonApiStore.new)
    @person_factory = PersonFactory.new(@person_manager.max_id)
  end

end
