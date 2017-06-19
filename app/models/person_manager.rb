class PersonManager
  @@users ||= {}
  @@user_id ||= 0
  @@user_count ||= 0

  def initialize(session)
    @session = session
    init_from_session
  end

  def self.users
    @@users
  end

  def users
    @users.dup
  end

  def self.create_person(name)
    @@user_id += 1
    @@user_count += 1
    @person = Person.new(@@user_id, name)
  end

  def add_person(person)
    @users[person.id] = person
  end

  def save_users
    @session[:users] = @users
  end

  def person_edit(id, user_name)
    @users[id] = Person.new(id, user_name)
    save_users
  end

  def person_delete(user_id)
    @users.delete(user_id)
    save_users
  end

  def init_from_session
    @users ||= {}
    @session[:users].each { | id, user |  add_person(Person.new(user['id'], user['user_name'])) } if @session[:users]
  end

end
