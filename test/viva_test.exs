defmodule VivaTest do
  use ExUnit.Case, asynce: true
  doctest ExViva

  test "get_stations" do
    {:ok, stations} = ExViva.get_stations()
    assert is_list(stations)
    refute Enum.empty?(stations)
  end

  test "get_station(86)" do
    {:ok, %ExViva.StationSample{}} = ExViva.get_station(86)
  end
end
