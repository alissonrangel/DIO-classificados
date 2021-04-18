require "application_system_test_case"

class LoginsTest < ApplicationSystemTestCase
  
  def setup
    @user = FactoryBot.create(:user, password: "password", password_confirmation: "password" )
  end

  test "login com credenciais validas" do
    # user = FactoryBot.create(:user)
    # visit root_path
    # click_on "Entrar"
    # click_link "Entrar"
    # fill_in "E-mail", with: @user.email
    # fill_in "Senha", with: "password"
    # click_on "Entrar"
    # click_button "Entrar"
    
    login_as(@user, @user.password)

    assert_text "Bem vindo Darth Vader!"
  end

  test "login com credenciais invalidas" do
    # user = FactoryBot.create(:user)
    login_as(@user, "invalid_password")
    assert_equal new_session_path, current_path
    assert_text "E-mail ou senha inválidos"
  end
end
