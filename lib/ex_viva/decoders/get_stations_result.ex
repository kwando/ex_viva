defmodule ExViva.Decoders.GetStationsResult do
  defp map_station(station) do
    %ExViva.Station{
      id: station["ID"],
      latitude: station["Lat"],
      longitude: station["Lon"],
      name: station["Name"]
    }
  end

  def decode({request, response}) do
    case response do
      %{status: 200} ->
        {request,
         %{
           response
           | body: decode_body(response.body)
         }}
    end
  end

  defp decode_body(%{"GetStationsResult" => %{"Felmeddelande" => nil, "Stations" => stations}}) do
    Enum.map(stations, &map_station/1)
  end
end
