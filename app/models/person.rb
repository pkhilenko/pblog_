class Person
  attr_reader :user_name, :id
  attr_writer :user_name

  def initialize(id, name)
    @user_name = name
    @id = id
  end

  def to_h
    { id: @id, user_name: @user_name }
  end

end


