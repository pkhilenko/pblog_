class PetrablogController < ApplicationController
  include HTTParty

  def index
    @persons = HTTParty.get('http://127.0.0.1:3000/persons')
  end
end
