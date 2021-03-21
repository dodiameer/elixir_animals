defmodule Animals do
  @moduledoc """
  Documentation for `Animals`.
  """

  @doc """
  create_zoo returns list of zoo animals

  ## Examples

      iex> Animals.create_zoo
      ["lion", "tiger", "..."]
  """
  def create_zoo do
    ["lion", "tiger", "gorilla", "elephant", "monkey", "giraffe"]
  end

  @doc """
  randomise a list of zoo animals

  ## Examples

      iex> zoo = Animals.create_zoo()
      iex> Animals.randomise(zoo)
      ["monkey", "gorilla", "..."]
  """
  def randomise(zoo) do
    Enum.shuffle(zoo)
  end

  @doc """
  contains? takes a list of zoo animals and a single animal and returns a boolean
  as to whether or not the list contains the given animal.

  ## Examples

    iex> zoo = Animals.create_zoo
    iex> Animals.contains?(zoo, "gorilla")
    true
  """
  def contains?(zoo, animal) do
    Enum.member?(zoo, animal)
  end

  def see_animals(zoo, count) do
    {_seen, to_see} = Enum.split(zoo, -count)
    to_see
  end

  def save(zoo, filename) do
    binary = :erlang.term_to_binary(zoo)
    File.write(filename, binary)
  end

  def load(filename) do
    case File.read(filename) do
      {:ok, binary} -> :erlang.binary_to_term(binary)
      {:error, _reason} -> "File does not exist"
    end
  end

  def selection(number) do
    Animals.create_zoo() |> Animals.randomise() |> Animals.see_animals(number)
  end
end
