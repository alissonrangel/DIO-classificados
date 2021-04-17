require "application_system_test_case"

class LoginsTest < ApplicationSystemTestCase
  test "login com credenciais validas" do
    
    user = FactoryBot.create(:user)

    visit root_path

    click_on "Entrar"
    
    fill_in "E-mail", with: "vader@imperio.com"
    fill_in "Senha", with: "minhasenha"
    
    click_on "Entrar"
  
    assert_text "Bem vindo Darth Vader!"
  end
end
