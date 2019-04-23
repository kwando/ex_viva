defmodule VivaTest do
  use ExUnit.Case
  doctest Viva

  test "greets the world" do
    assert Viva.hello() == :world
  end
end
