class Person

  attr_reader :id
  attr_accessor :name

  def initialize(id, name)
    @id = id
    @name = name
  end

  def to_h
    { id: @id, name: @name }
  end

end


