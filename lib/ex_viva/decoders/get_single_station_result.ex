defmodule ExViva.Decoders.GetSingleStationResult do
  def handle_response({status, headers, body}, _opts) do
    {:ok, decoded_body} = decode(body)
    {status, headers, decoded_body}
  end

  def decode(%{"GetSingleStationResult" => %{"Felmeddelande" => nil, "ID" => station_id, "Samples" => samples}}) do
    {:ok, %ExViva.StationSample{samples: map_samples(samples), station_id: station_id, requested_at: DateTime.utc_now()}}
  end

  def decode(%{"GetSingleStationResult" => %{"Felmeddelande" => error}}) do
    {:error, {:station_error, error}}
  end

  defp map_samples(samples) do
    for sample <- samples do
      ExViva.Decoders.Sample.simple_decode(sample)
    end
  end
end
