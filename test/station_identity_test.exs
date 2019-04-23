defmodule Viva.StationIdentityTest do
  use ExUnit.Case, async: true

  test "Viva.Station" do
    assert Viva.StationIdentity.station_id(%Viva.Station{id: 329})
  end

  test "Viva.StationSample" do
    assert 11009 = Viva.StationIdentity.station_id(%Viva.StationSample{station_id: 11009})
  end

  test "Viva.Sample" do
    assert 19 = Viva.StationIdentity.station_id(%Viva.Sample{station_id: 19})
  end

  test "number" do
    assert 572 = Viva.StationIdentity.station_id(572)
  end
end
