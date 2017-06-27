class PersonFileStore
  require 'json'

  def initialize
    @textfile = File.expand_path('../person_store.txt', __FILE__)
  end

  def read
    persons = JSON.parse(File.open(@textfile, 'r'){ |file| file.read }) || {}
    persons.keys.inject({}) { |h, id| h[id.to_i] = Person.new(id.to_i,  persons[id]); h }
  end

  def write(persons)
    persons = persons.values.inject({}) { |h, person| h[person.id] = person.to_h; h }
    File.open(@textfile, 'w'){ |file| file.puts JSON.generate(persons) }
  end
end
