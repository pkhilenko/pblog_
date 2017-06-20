require 'test_helper'

class PersonTest < ActiveSupport::TestCase
  test 'get @person.to_h' do
    @person = Person.new(1, 'vasya@mail.ru')
    assert_equal({ id: 1, name: 'vasya@mail.ru' }, @person.to_h)
  end

  test 'get obj.user_name' do
    @person = Person.new(1, 'vasya@mail.ru')
    assert_equal('vasya@mail.ru', @person.name)
  end

  test 'get obj.id' do
    @person = Person.new(1, 'vasya@mail.ru')
    assert_equal(1, @person.id)
  end

end

