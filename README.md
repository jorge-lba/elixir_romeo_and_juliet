# RomeoAndJuliet
Neste projetos iremos implementar o exercício [Fizz Buzz](https://en.wikipedia.org/wiki/Fizz_buzz), com uma alteração onde Fizz = Romeo, Buzz = Juliet e FizzBuzz = RomeoAndJuliet.

O objetivo desse exercício é verificar em uma lista de valores numéricos quais são múltiplos de tres (Romeo), múltiplos de cinco (Juliet) e os múltiplos de tres e cinco (RomeoAndJuliet).

***obs.:** A ideia de mudar o FizzBuzz para RomeoAndJuliet foi inspirada em um [video](https://www.youtube.com/watch?v=xK410TQf3ho) do canal [Eduardo Mendes](https://www.youtube.com/c/Dunossauro/featured).

## Criando o Projeto
Para criar um novo projeto vamos abrir o terminal dentro de uma pasta e executar o comando `mix new romeo_and_juliet`.
Digite o comando `cd romeo_and_juliet` para entrar na pasta do projeto.

## Lógica
Vamos adicionar nossa lógica no arquivo `romeo_and_juliet.ex` dentro da pasta `lib` que foi criada. 

```elixir
defmodule RomeoAndJuliet do
  def build(number_list) do
    number_list
    |> Enum.map( &value_is/1)
  end

  defp value_is(number) when rem(number, 3) == 0 and rem(number, 5) == 0, do: :RomeoAndJuliet
  defp value_is(number) when rem(number, 3) == 0, do: :Romeo
  defp value_is(number) when rem(number, 5) == 0, do: :Juliet
  defp value_is(number), do: number

end
```

O código é bem simples e vamos entender o que está acontecendo.

O `defmodule` cria um módulo para adicionarmos toda a nossa lógica.

Em seguida temos nossa função principal `def build(number_list)`, essa função vai executar nossa lógica. Dentro dela estamos adicionando nossa variável `number_list` seguida do operador pipe `|>` que vai passar o valor da variável para o primeiro parâmetro da função `Enum.map`.

A função `Enum.map` vai chamar a função `value_is` passando cada um dos itens da lista.

A função `value_is` vai verificar em qual dos casos o valor recebido vai se enquadrar múltiplo de 3, 5, 3 e 5 ou nenhum.

O Elixir implementa o **Pattern Matching** e graças a isso podemos utilizar essa sequencia de funções com o mesmo nome mas com implementações diferentes.

O que acontece básicamente é que a primeira função `value_is` é chamada, quando o valor não passa pelo caso é gerado um "erro" de match, com isso é chamada a próxima função com o mesmo nome e assim por diante até chegar na ultima.

## Testes
Para desenvolver nossos testes vamos usar o arquivo `romeo_and_juliet_test.exs` que está dentro da pasta `test`.

Iremos adicionar o seguinte código:
```elixir
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
```

Para rodarmos os testes precisamos criar um modulo contendo o `ExUnit.Case`, este modulo vai trazer as configurações necessárias para escrevermos nossos testes.

Iniciamos nossos teste com passando o nome da **função** e sua **aridade** depois do comando `describe`.

Em seguida iniciamos o nosso teste passando uma breve *discrição* do que é esperado desse teste depois do comando `test`.

Para compor nossos testes usamos duas variáveis a `expected_response` e `input_value`, nelas vamos adicionar o valor de resposta esperado e o valor que vai ser passado para nossa função.

Para iniciar o teste da função vamos usar o comando `assert` em seguida a nossa função `RomeoAndJuliet.build` passando como parâmetro o `input_value` e para finalizar o operado de igualdade `==` comparando o resultado com o variável `expected_response`.

Vamos rodar os testes com o comando `mix test`, so resultado deve ser o seguinte:

```sh
.....

Finished in 0.02 seconds
5 tests, 0 failures

Randomized with seed 202641
```