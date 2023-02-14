defmodule FizzBuzz do
  @type n :: integer

  @spec tell(n) :: :ok
  def tell(n) when is_integer(n), do: tell(0..n)
    
  @spec tell(Enumerable.t) :: :ok
  def tell(enum) do
    stream(enum) |> Enum.map(&IO.inspect(&1))
    
    :ok
  end

  @spec list(n) :: list
  def list(n) when is_integer(n), do: list(0..n)

  @spec list(Enumerable.t) :: list
  def list(enum), do: stream(enum) |> Enum.to_list()

  defp stream(enum), do: Stream.map(enum, &cast(&1))

  defp cast(n) do
    n
    |> assign(fizz(n))
    |> assign(buzz(n))
  end

  defp assign(old, new) when is_binary(old) and is_binary(new), do: old <> new
  defp assign(old, _) when is_binary(old), do: old
  defp assign(_, new), do: new

  defp fizz(n) when rem(n, 3) == 0, do: "Fizz" 
  defp fizz(n), do: n

  defp buzz(n) when rem(n, 5) == 0, do: "Buzz"
  defp buzz(n), do: n
end

ExUnit.start()

defmodule FizzBuzz.Test do
  use ExUnit.Case, async: true

  import FizzBuzz

  test "casts Fizz" do
    with by_three <- Enum.map(0..999_999, &(&1 * 3)) do
      assert list(by_three) |> Enum.all?(&(&1 =~ "Fizz"))       
    end
  end 

  test "casts Buzz" do
    with by_five <- Enum.map(0..999_999, &(&1 * 5)) do
      assert list(by_five) |> Enum.all?(&(&1 =~ "Buzz"))       
    end   
  end 

  test "casts FizzBuzz" do
    with by_fifteen <- Enum.map(0..999_999, &(&1 * 3 * 5)) do
      assert list(by_fifteen) |> Enum.all?(&(&1 =~ "FizzBuzz"))       
    end 
  end 

  test "leaves others alone" do
    with no_fizz <- Enum.filter(0..999_999, &(rem(&1, 3) != 0)),
         no_fizzbuzz <- Enum.filter(no_fizz, &(rem(&1, 5) != 0)) do
      assert list(no_fizzbuzz) |> Enum.all?(&is_integer(&1))
    end
  end

  test "maintains length" do
    with numbers <- 0..Enum.random(0..999_999),
         fizzbuzz <- list(numbers) do
      assert length(Enum.to_list(numbers)) == length(fizzbuzz)
    end
  end
end

