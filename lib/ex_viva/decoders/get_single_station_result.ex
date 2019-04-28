defmodule ExViva.Decoders.GetSingleStationResult do
  def handle_response({status, headers, %{"GetSingleStationResult" => %{"Felmeddelande" => nil, "ID" => station_id, "Samples" => samples}}}, _opts) do
    {status, headers, %ExViva.StationSample{samples: map_samples(samples), station_id: station_id, requested_at: DateTime.utc_now()}}
  end

  defp map_samples(samples) do
    for sample <- samples do
      ExViva.Decoders.Sample.simple_decode(sample)
    end
  end
end
