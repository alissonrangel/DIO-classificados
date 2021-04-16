require "test_helper"

class FirstTest < ActiveSupport::TestCase
  test "Esse é o meu primeiro teste" do
    variavel = "Meu nome é Alisson"
    assert_equal "Meu nome é Alisson", variavel
  end
end