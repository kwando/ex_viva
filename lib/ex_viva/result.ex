defmodule ExViva.Result do
  def ok?({:ok, _}), do: true
  def ok?(_), do: false
  def unwrap({:ok, value}), do: value
end
