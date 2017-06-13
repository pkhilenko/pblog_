class Passport

  attr_reader :number

  def initialize(number)
    @number = number
  end

end

p = Passport.new('4005678987')


