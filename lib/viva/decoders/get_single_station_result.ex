defmodule Viva.Decoders.GetSingleStationResult do
  def handle_response({status, headers, %{"GetSingleStationResult" => body = %{"Felmeddelande" => nil, "ID" => station_id, "Samples" => samples}}}, _opts) do
    {status, headers, %Viva.StationSample{samples: map_samples(samples), station_id: station_id, requested_at: DateTime.utc_now()}}
  end

  defp map_samples(samples) do
    for sample <- samples do
      Viva.Decoders.Sample.simple_decode(sample)
    end
  end
end
