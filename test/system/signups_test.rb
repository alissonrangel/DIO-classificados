require "application_system_test_case"

class SignupsTest < ApplicationSystemTestCase
  test "Usuário faz cadastro com dados válidos" do
    visit '/'
    click_on "Cadastre-se"
    fill_in "Nome", with: "Darth Vader"
    fill_in "E-mail", with: "vader@imperio.com"
    fill_in "Senha", with: "minhasenha"
    fill_in "Confirme sua senha", with: "minhasenha"
    click_on "Cadastrar"
    assert_text "Cadastro realizado com sucesso!"
  end

  test "Usuário faz cadastro com dados inválidos" do
    visit '/'
    click_on "Cadastre-se"    
    click_on "Cadastrar"
    
    assert_text "Erro ao salvar"
  end
end
