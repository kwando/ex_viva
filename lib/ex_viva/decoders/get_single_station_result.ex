defmodule ExViva.Decoders.GetSingleStationResult do
  def handle_response({status, headers, body}, _opts) do
    {:ok, decoded_body} = decode_body(body)
    {status, headers, decoded_body}
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

  def decode_body(%{
        "GetSingleStationResult" => %{
          "Felmeddelande" => error,
          "ID" => station_id,
          "Samples" => samples
        }
      }) do
    sample = %ExViva.StationSample{
      samples: map_samples(samples),
      station_id: station_id,
      requested_at: DateTime.utc_now(),
      error: error
    }

    {:ok, sample}
  end

  defp map_samples(samples) do
    for sample <- samples do
      ExViva.Decoders.Sample.simple_decode(sample)
    end
  end
end
