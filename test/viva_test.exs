defmodule VivaTest do
  use ExUnit.Case, asynce: true
  doctest Viva

  test "get_stations" do
    {:ok, stations} = Viva.get_stations()
    assert is_list(stations)
    refute Enum.empty?(stations)
  end

  test "get_station(86)" do
    {:ok, %Viva.StationSample{}} = Viva.get_station(86)
  end
end
