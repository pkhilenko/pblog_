class Person
  @@user_id = 0

  def initialize(user)
    @@user_id += 1
    @name = user
    @id = @@user_id
    PersonManager.new(self)
  end

  def user
    {name: @name, id: @id}
  end

end
