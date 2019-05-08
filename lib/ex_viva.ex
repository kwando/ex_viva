defmodule ExViva do
  @base_url "https://services.viva.sjofartsverket.se:8080"
  alias ExViva.{Decoders, HTTP}
  @moduledoc """
  This modules provides functions to fetch imformation from the Swedish Maritime Administration.
  The data from the API is not interpreted in any way, it is just normalized and parsed
  into appropriate Elixir datatypes.
  """

  @doc """
  Returns a list of %ExViva.Station{} structs.
  """
  def get_stations(opts \\ []) do
    get_stations_request()
    |> request(opts)
  end

  @doc """
  Get observations for a particaluar station.

  Station_id can be a number, a %ExViva.Station{} struct or anything that implements
  the Viva.StationIdentity protocol.
  """
  def get_station(station_id, opts \\ []) do
    get_station_request(station_id, opts)
    |> request(opts)
  end

  def get_stations_request() do
    HTTP.Request.get("/output/vivaoutputservice.svc/vivastation/")
    |> HTTP.Request.accept_json()
    |> HTTP.Request.add_response_handler(:normalize_headers)
    |> HTTP.Request.add_response_handler(Decoders.GetStationsResult)
  end

  def get_station_request(station_id, opts \\ []) do
    station_id = ExViva.StationIdentity.station_id(station_id)

    HTTP.Request.get("/output/vivaoutputservice.svc/vivastation/#{station_id}")
    |> HTTP.Request.accept_json()
    |> HTTP.Request.add_response_handler(:normalize_headers)
    |> use_decoder(Decoders.GetSingleStationResult, get_opt(opts, :decode, true))
  end

  def sample_all(opts \\ []) do
    with {:ok, stations} <- get_stations() do
      {success, errors} = stations
      |> Task.async_stream(&get_station(&1, opts), max_concurrency: get_opt(opts, :concurrency, System.schedulers_online))
      |> Stream.map(&elem(&1, 1))
      |> Enum.split_with(fn {:ok, _result} -> true end)


      {:ok, success |> Enum.flat_map(fn {:ok, result} -> result.samples end), errors}
    end
  end

  defp request(request, opts) do
    request
    |> HTTP.Request.put_header("User-Agent", "ExViva 0.0.1")
    |> HTTP.request(base_url: @base_url)
    |> unwrap(get_opt(opts, :unwrap, true))
  end

  defp get_opt(opts, key, default), do: Keyword.get(opts, key, default)

  defp use_decoder(request, decoder, true) do
    request
    |> HTTP.Request.add_response_handler(decoder)
  end
  defp use_decoder(request, _, _), do: request

  defp unwrap({:ok, {200, _headers, body}}, true) do
    {:ok, body}
  end
  defp unwrap(result, false), do: result
end
