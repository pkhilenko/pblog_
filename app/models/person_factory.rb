class PersonFactory

  def initialize(max_id)
    @id = max_id
  end

  def create_person(name, email, date_of_birth, salary)
    @id += 1
    Person.new(@id, name, email, date_of_birth, salary)
  end

end
