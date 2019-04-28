defmodule Viva.StationIdentityTest do
  use ExUnit.Case, async: true
  alias ExViva.{StationIdentity, Station, StationSample, Sample}

  test "Viva.Station" do
    assert StationIdentity.station_id(%Station{id: 329})
  end

  test "Viva.StationSample" do
    assert 11009 = StationIdentity.station_id(%StationSample{station_id: 11009})
  end

  test "Viva.Sample" do
    assert 19 = StationIdentity.station_id(%Sample{station_id: 19})
  end

  test "number" do
    assert 572 = StationIdentity.station_id(572)
  end
end
