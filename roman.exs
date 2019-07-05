defmodule Roman do
  @doc """
  Convert the number to a roman number.
  """
  @spec numerals(pos_integer) :: String.t()
  def numerals(number) do
    {0, numeral} = Enum.reduce(pairs(), {number, ""}, &parse_for_numeral/2)
    numeral
  end

  defp pairs() do
    numbers = [1000, 900, 500, 400, 100, 90, 50, 40, 10, 9, 5, 4, 1]
    romans = ~w[M CM D CD C XC L XL X IX V IV I]
    Enum.zip(numbers, romans)
  end

  defp parse_for_numeral({decimal, _roman}, {number, parsed}) when number < decimal do
    {number, parsed}
  end

  defp parse_for_numeral({decimal, roman} = pair, {number, parsed}) do  
    new_number = number - decimal
    new_parsed = parsed <> roman
    parse_for_numeral(pair, {new_number, new_parsed})  
  end
end
