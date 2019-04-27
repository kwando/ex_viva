defmodule Viva.Station do
  defstruct [:id, :name, :latitude, :longitude]
  @moduledoc """
  Datatype holding information about a Viva.Station.
  """

  defimpl Viva.StationIdentity, for: __MODULE__  do
    def station_id(%{id: id}), do: id
  end
end
