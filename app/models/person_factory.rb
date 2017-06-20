class PersonFactory

  def initialize(max_id)
    @id = max_id
  end

  def create_person(name)
    @id += 1
    Person.new(@id, name)
  end

end
