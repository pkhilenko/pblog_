class Point
  def initialize(x, y)
    @x = x
    @y = y
  end

  def to_s
    "(#@x, #@y)"
  end
end

puts Point.new(22, -3)

point1 = Point.new(-22, -33)
puts point1
