defmodule RomeoAndJulietTest do
  use ExUnit.Case

  describe "build/1" do
    test "Deve retornar dois valores com Romeo" do
      expected_response = [:Romeo, :Romeo]
      input_value = [3, 6]

      assert RomeoAndJuliet.build(input_value) == expected_response
    end

    test "Deve retornar dois valores com Juliet" do
      expected_response = [:Juliet, :Juliet]
      input_value = [5, 10]

      assert RomeoAndJuliet.build(input_value) == expected_response
    end

    test "Deve retornar dois valores com RomeoAndJuliet" do
      expected_response = [:RomeoAndJuliet, :RomeoAndJuliet]
      input_value = [15, 30]

      assert RomeoAndJuliet.build(input_value) == expected_response
    end

    test "Deve retornar os valores 1 e 2" do
      expected_response = [1, 2]
      input_value = [1, 2]

      assert RomeoAndJuliet.build(input_value) == expected_response
    end

    test "Deve retornar os valores 1, 2, Romeo, Juliet e RomeoAndJuliet" do
      expected_response = [1, 2, :Romeo, :Juliet, :RomeoAndJuliet]
      input_value = [1, 2, 3, 5, 15]

      assert RomeoAndJuliet.build(input_value) == expected_response
    end
  end
end
