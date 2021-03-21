defmodule AnimalsTest do
  use ExUnit.Case
  doctest Animals

  test "Randomise" do
    zoo = Animals.create_zoo()
    refute zoo == Animals.randomise(zoo)
  end
end
