
defprotocol Viva.StationIdentity do
  def station_id(arg)
end


defimpl Viva.StationIdentity, for: Integer do
  def station_id(value), do: value
end
