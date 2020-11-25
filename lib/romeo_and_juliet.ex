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
