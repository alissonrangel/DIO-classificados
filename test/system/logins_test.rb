require "application_system_test_case"

class LoginsTest < ApplicationSystemTestCase
  test "login com credenciais validas" do
    user = FactoryBot.create(:user)
    visit root_path
    # click_on "Entrar"
    click_link "Entrar"
    fill_in "E-mail", with: "vader1@empire.org"
    fill_in "Senha", with: "password"
    # click_on "Entrar"
    click_button "Entrar"
    assert_text "Bem vindo Darth Vader!"
  end
end
