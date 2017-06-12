require "application_system_test_case"

class HomeTest < ApplicationSystemTestCase
  test "visiting the index" do
    visit root_url
    assert_selector "h1", text: "Hi All!"
  end

  test 'signup user' do
    visit root_url
    click_on 'Sign Up'
    fill_in 'email[{:class=>"form-control"}]', with: 'vasya@mail.ru'
    click_on 'Log in'
    assert_text 'vasya@mail.ru'
  end

  test 'delete user' do
    visit root_url
    click_on 'Sign Up'
    fill_in 'email[{:class=>"form-control"}]', with: 'vaska@mail.ru'
    click_on 'Log in'
    assert_text 'vaska@mail.ru'
    click_on 'Вход'
    fill_in 'email[{:class=>"form-control"}]', with: 'vaska@mail.ru'
    click_on 'Log in'
    assert_text 'Вы успешно вошли на сайт'
    visit users_url
    click_on 'vaska@mail.ru'
    assert_selector "h1", text: 'vaska@mail.ru'
    click_on 'vaska@mail.ru'
    click_on 'Удалить пользователя'
    assert_text 'Пользователь успешно удален'
  end


  test 'login user' do
    visit root_url
    click_on 'Sign Up'
    fill_in 'email[{:class=>"form-control"}]', with: 'vasya@mail.ru'
    click_on 'Log in'
    assert_text 'vasya@mail.ru'
    click_on 'Вход'
    fill_in 'email[{:class=>"form-control"}]', with: 'vasya@mail.ru'
    click_on 'Log in'
    assert_text 'Вы успешно вошли на сайт'
  end

  test 'logout user' do
    visit root_url
    click_on 'Sign Up'
    fill_in 'email[{:class=>"form-control"}]', with: 'vasya@mail.ru'
    click_on 'Log in'
    assert_text 'vasya@mail.ru'
    click_on 'Вход'
    fill_in 'email[{:class=>"form-control"}]', with: 'vasya@mail.ru'
    click_on 'Log in'
    assert_text 'Вы успешно вошли на сайт'
    click_on 'Выход'
    assert_text 'Вы успешно вышли с сайта'
  end
end
