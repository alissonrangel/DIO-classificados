require "test_helper"

class UserTest < ActiveSupport::TestCase
  test "nome é obrigatório" do 
    user = User.new(name: nil)

    user.save

    assert user.errors[:name].any?
  end

  test "email é obrigatório e no formato válido" do 
    user = User.new(email: nil)
    user.save

    assert user.errors[:email].any?

    user = User.new(email: 'invalido')
    user.save

    assert user.errors[:email].any?

    user = User.new(email: 'valido@exemplo.com')
    user.save

    refute user.errors[:email].any?
  end

  test "email é único" do 
    user1 = User.create!(name: 'nome1', email: 'email@mail.com', password: '123', password_confirmation: '123')
    
    user2 = User.create(email: 'email@mail.com')

    assert user2.errors[:email].any?
  end
end
