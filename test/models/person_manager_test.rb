require 'test_helper'

class PersonManagerTest < ActiveSupport::TestCase

  def setup
    @person_manager = PersonManager.new(PersonSessionStore.new({}))
    @person_factory = PersonFactory.new(@person_manager.max_id)

    @person = @person_factory.create_person('vasya@mail.ru')
    @person_manager.set_person @person
    @person_manager.save_persons

    @person2 = @person_factory.create_person('gena@mail.ru')
    @person_manager.set_person @person2
    @person_manager.save_persons

    @person3 = @person_factory.create_person('genadiy@mail.ru')
    @person_manager.set_person @person3
    @person_manager.save_persons
  end

  test 'get_person' do
    assert_equal(@person_manager.get_person(1).name, 'vasya@mail.ru')
  end

  test 'set_person' do
    @person2.name = 'lena@ya.ru'
    @person_manager.set_person(@person2)
    @person_manager.save_persons
    assert_equal(@person_manager.get_person(2).name, 'lena@ya.ru')
  end

  test 'remove_person' do
    @person_manager.remove_person(@person3)
    @person_manager.save_persons
    assert_equal(@person_manager.get_person(3), nil)
  end

end
