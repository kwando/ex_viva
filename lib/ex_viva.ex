defmodule ExViva do
  @base_url "https://services.viva.sjofartsverket.se:8080"
  alias ExViva.{Decoders, Result}

  @moduledoc """
  This modules provides functions to fetch imformation from the Swedish Maritime Administration.
  The data from the API is not interpreted in any way, it is just normalized and parsed
  into appropriate Elixir datatypes.
  """

  def base_request() do
    Req.new(base_url: @base_url)
  end

  @doc """
  Returns a list of %ExViva.Station{} structs.
  """
  def get_stations() do
    base_request()
    |> Req.Request.append_response_steps(decode_body: &Decoders.GetStationsResult.decode/1)
    |> Req.get!(url: "/output/vivaoutputservice.svc/vivastation/")
    |> Map.fetch!(:body)
    |> then(&{:ok, &1})
  end

  @doc """
  Get observations for a particaluar station.

  Station_id can be a number, a %ExViva.Station{} struct or anything that implements
  the Viva.StationIdentity protocol.
  """
  def get_station(station_id) do
    station_id = ExViva.StationIdentity.station_id(station_id)

    base_request()
    |> Req.Request.append_response_steps(decode_body: &Decoders.GetSingleStationResult.decode/1)
    |> Req.get!(url: "/output/vivaoutputservice.svc/vivastation/#{station_id}")
    |> Map.fetch!(:body)
  end

  def sample_all() do
    with {:ok, stations} <- get_stations() do
      {success, errors} =
        stations
        |> Task.async_stream(&get_station(&1))
        |> Stream.map(&elem(&1, 1))
        |> Enum.split_with(&Result.ok?/1)

      {:ok, success |> Enum.flat_map(&Result.unwrap(&1).samples), errors}
    end
  end
end
