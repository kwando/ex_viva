
defprotocol ExViva.StationIdentity do
  def station_id(arg)
end


defimpl ExViva.StationIdentity, for: Integer do
  def station_id(value), do: value
end
