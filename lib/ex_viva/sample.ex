defmodule ExViva.StationSample do
  defstruct [
    station_id: nil,
    samples: [],
    requested_at: nil
  ]
  @moduledoc """
  Datatype for holding information that is returned from the API.
  """

  defimpl ExViva.StationIdentity, for: __MODULE__  do
    def station_id(%{station_id: station_id}), do: station_id
  end
end

defmodule ExViva.Sample do
  defstruct [:calm, :heading, :message, :name, :quality, :trend, :station_id, :type, :unit, :updated_at, :value, :water_level_reference]

  defimpl ExViva.StationIdentity, for: __MODULE__  do
    def station_id(%{station_id: station_id}), do: station_id
  end
end
