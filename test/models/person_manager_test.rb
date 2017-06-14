require 'test_helper'

class PersonManagerTest < ActiveSupport::TestCase
  test 'create_person' do
    PersonManager.create_person('vasya@mail.ru')
    @persons = PersonManager.new
    assert_equal('vasya@mail.ru', @persons.users[1].user_name)

    @persons.person_edit(1, 'gena@mail.ru')
    assert_equal('gena@mail.ru', @persons.users[1].user_name )

    @persons.person_delete(1)
    assert_equal(nil, @persons.users[1])
  end

end
