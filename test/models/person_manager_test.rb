require 'test_helper'

class PersonManagerTest < ActiveSupport::TestCase

  def setup
    session = {}
    @person_manager = PersonManager.new session
    @user = PersonManager.create_person('vasya@mail.ru')
    @person_manager.add_person(@user)
    @person_manager.save_users
    @user2 = PersonManager.create_person('lena@rambler.ru')
    @person_manager.add_person(@user2)
    @person_manager.save_users
    @user3 = PersonManager.create_person('yula@ya.ru')
    @person_manager.add_person(@user3)
    @person_manager.save_users

  end

  test 'create_person' do
    assert_equal('vasya@mail.ru', @person_manager.users[1].user_name)
  end

  test 'edit person' do
    @person_manager.person_edit(2, 'gena@mail.ru')
    assert_equal('gena@mail.ru', @person_manager.users[2].user_name )
  end

  test 'delete person' do
    @person_manager.person_delete(3)
    assert_equal(nil, @person_manager.users[3])
  end

end
