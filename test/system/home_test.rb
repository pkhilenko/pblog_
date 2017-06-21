require "application_system_test_case"

class HomeTest < ApplicationSystemTestCase
  test "visiting the index" do
    visit root_url
    assert_selector "h1", text: "Hi All!"
  end

  test 'New Person' do
    visit root_url
    click_on 'New Person'
    fill_in 'email[{:class=>"form-control"}]', with: 'vasya@mail.ru'
    click_on 'Save'
    assert_text 'vasya@mail.ru'
  end

  test 'Show Person' do
    visit root_url
    click_on 'New Person'
    fill_in 'email[{:class=>"form-control"}]', with: 'gena@ya.ru'
    click_on 'Save'
    click_on 'gena@ya.ru'
    assert_selector 'h1', text: 'gena@ya.ru'
  end

  test 'Edit Person' do
    visit root_url
    click_on 'New Person'
    fill_in 'email[{:class=>"form-control"}]', with: 'gena@mail.ru'
    click_on 'Save'
    click_on 'gena@mail.ru'
    click_on 'Редактировать'
    fill_in 'email[{:class=>"form-control"}]', with: 'john@mail.ru'
    click_on 'Обновить'
    assert_text 'john@mail.ru'
  end

  test 'Delete Person' do
    visit root_url
    click_on 'New Person'
    fill_in 'email[{:class=>"form-control"}]', with: 'gena@gmail.com'
    click_on 'Save'
    click_on 'gena@gmail.com'
    click_on 'Удалить пользователя'
    refute_text 'gena@gmail.com'
  end
end
