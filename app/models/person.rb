class Person

  attr_reader :id
  attr_accessor :name, :email, :date_of_birth, :salary

  def initialize(id, name, email, date_of_birth, salary)
    @id = id
    @name = name
    @email = email
    @date_of_birth = date_of_birth
    @salary = salary
  end

  def to_h
    { id: @id, name: @name, email: @email, date_of_birth: @date_of_birth, salary: @salary }
  end

end


