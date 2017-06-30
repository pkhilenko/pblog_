class PersonJsonApiStore
  require 'json'
  include HTTParty

  def initialize
    @persons = HTTParty.get('http://127.0.0.1:3000/persons')
    @person_store = File.expand_path('../person_json_api_store.json', __FILE__)
  end

  def read
    persons = @persons['result'] || {}
    persons.each.inject({}) { |h, obj| h[obj['id']] = Person.new(obj['id'], obj); h }
  end

  def write(persons)
    persons = persons.values.inject({}) { |h, person| h[person.id] = person.to_h; h }
    File.open(@person_store, 'w'){ |file| file.puts JSON.generate(persons) }
  end
end
