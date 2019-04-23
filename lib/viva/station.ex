defmodule Viva.Station do
  defstruct [:id, :name, :latitude, :longitude]

  defimpl Viva.StationIdentity, for: __MODULE__  do
    def station_id(%{id: id}), do: id
  end
end
