class PersonManager
  @@users ||= {}
  @@user_id ||= 0
  @@user_count ||= 0

  def initialize(session)
    @users = {}
    @session = session
    init_from_session
  end

  def self.users
    @@users
  end

  def users
    @users.dup
  end

  def self.create_person(name, session)
    @@user_id += 1
    @@user_count += 1
    @peron = Person.new(@@user_id, name)
    @@users[@@user_id] = @peron
    session[:users] = @@users
    session[:user] = @person
  end

  def self.delete_all_persons
    @@users = {}
  end

  def person_edit(id, user_name)
    @users[id]['user_name'] = user_name
  end

  def person_delete(user_id)
    @users.delete(user_id)
  end

  def init_from_session
    @session[:users].each{ |id, name| @users[id.to_i] = name } if @session[:users]
  end


end
