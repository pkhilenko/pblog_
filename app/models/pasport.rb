class Passport

  def initialize(number)
    @number = number
  end

  def number
    @number
  end

  def number=(value)
    @number = value
  end

end

p = Passport.new('4005678987')
puts p.number
p.number = '353464654645'
puts p.number

