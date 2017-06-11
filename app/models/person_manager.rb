class PersonManager
  @@users ||= {}
  def initialize(person)
    @@users[person.user[:id]] = person.user[:name]
  end

  def self.users
    @@users
  end

  def self.edit(user)
    @@users[user['id']] = user['name']
  end

  def self.destroy(user)
    @@users.delete(user['id']) if user['id']
  end

end
