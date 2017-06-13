class Person
  attr_reader :user_name, :id
  attr_writer :user_name

  def initialize(id, user_name)
    @user_name = user_name
    @id = id
  end

  def to_h
    { id: @id, user_name: @username }
  end

end





