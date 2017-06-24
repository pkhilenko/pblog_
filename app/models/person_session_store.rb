class PersonSessionStore

  def initialize(session)
    @session = session
  end

  def read
    result = {}
    persons = @session[:persons] || {}
    persons.each_key do |id|
      result[id] = Person.new(id, persons[id]['name'], persons[id]['email'], persons[id]['date_of_birth'], persons[id]['salary'] )
    end
    result
  end


  def write(persons)
    result = {}
    persons.each_value do |person|
      result[person.id] = person.to_h
    end
    @session[:persons] = result
  end

end
