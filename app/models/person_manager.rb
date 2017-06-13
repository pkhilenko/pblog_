class PersonManager
  @@users ||= {}
  @@user_id ||= 0
  @@user_count ||= 0

  def users
    @@users
  end

  def self.create_person(name)
    @@user_id += 1
    @@user_count += 1
    @@users[@@user_id] = Person.new(@@user_id, name)
  end

  def person_edit(id, user_name)
    @@users[id].user_name = user_name
  end

  def person_delete(user_id)
    @@users.delete(user_id)
  end
end
