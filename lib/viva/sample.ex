defmodule Viva.StationSample do
  defstruct [
    station_id: nil,
    samples: [],
    requested_at: nil
  ]
  @moduledoc """
  Datatype for holding information that is returned from the API.
  """

  defimpl Viva.StationIdentity, for: __MODULE__  do
    def station_id(%{station_id: station_id}), do: station_id
  end
end

defmodule Viva.Sample do
  defstruct [:calm, :heading, :message, :name, :quality, :trend, :station_id, :type, :unit, :updated_at, :value, :water_level_reference]

  defimpl Viva.StationIdentity, for: __MODULE__  do
    def station_id(%{station_id: station_id}), do: station_id
  end
end
