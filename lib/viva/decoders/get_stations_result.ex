defmodule Viva.Decoders.GetStationsResult do
  def handle_response({status, headers, %{"GetStationsResult" => %{"Felmeddelande" => nil, "Stations" => stations}}}, _opts) do
    {status, headers, Enum.map(stations, &map_station/1)}
  end

  defp map_station(station) do
    %Viva.Station{
      id: station["ID"],
      latitude: station["Lat"],
      longitude: station["Lon"],
      name: station["Name"]
    }
  end
end
