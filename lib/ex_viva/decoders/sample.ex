defmodule ExViva.Decoders.Sample do
  defmacrop v!(key) do
    quote do
      Map.fetch!(var!(sample), unquote(key))
    end
  end

  def simple_decode(sample) do
    unit = v!("Unit")
    type = parse_type(v!("Type"), unit)

    %ExViva.Sample{
      heading: v!("Heading"),
      unit: v!("Unit"),
      trend: v!("Trend"),
      water_level_reference: v!("WaterLevelReference"),
      calm: v!("Calm"),
      type: type,
      value: parse_value(v!("Value"), unit, type)
    }
    |> with_name(sample)
    |> with_common(sample)
  end

  defp with_station_id(result, %{"StationID" => station_id}) do
    %{result | station_id: station_id}
  end

  defp with_message(result, %{"Msg" => message}) do
    %{result | message: message}
  end

  defp with_quality(result, %{"Quality" => quality}) do
    %{result | quality: parse_quality(quality)}
  end

  defp with_timestamp(result, %{"Updated" => updated}) do
    %{result | updated_at: parse_timestamp(updated)}
  end

  defp with_name(result, %{"Name" => name}) do
    %{result | name: name}
  end

  defp with_common(result, sample) do
    result
    |> with_name(sample)
    |> with_station_id(sample)
    |> with_message(sample)
    |> with_quality(sample)
    |> with_timestamp(sample)
  end

  defp directional_float(value) do
    case String.split(value, " ", parts: 2) do
      [_dir, value] ->
        String.to_float(value)

      [value] ->
        single_float(value)
    end
  end

  defp parse_timestamp(timestamp) do
    String.replace(timestamp, " ", "T")
    |> NaiveDateTime.from_iso8601!()
  end

  defp single_float(value) do
    try do
      String.to_float(value)
    rescue
      ArgumentError ->
        String.to_integer(value) * 1.0
    end
  end

  defp parse_value(value, unit, type) do
    try do
      parse_value(value, unit)
    catch
      error ->
        require Logger
        Logger.error("failed to decode: #{inspect(type)}")
        raise error
    end
  end

  defp parse_value(value, "m³/s"), do: single_float(value)
  defp parse_value(value, "mm/h"), do: single_float(value)
  defp parse_value(value, "#/cm2/h"), do: single_float(value)

  defp parse_value("-", _unit), do: nil
  defp parse_value(value, unit) when unit in ["m/s", "knop", "s"], do: directional_float(value)

  defp parse_value(value, "cm"), do: single_float(value)

  defp parse_value(value, unit) when unit in ["‰", "%", "kg/m³", "°C", "mbar", "ml/l", "hPa"],
    do: single_float(value)

  defp parse_value(">" <> value, "m") do
    {:less_than, String.to_integer(value)}
  end

  defp parse_value(value, "m"), do: directional_float(value)

  defp parse_type("wind", _unit), do: :wind
  defp parse_type("level", _unit), do: :water_level
  defp parse_type("watertemp", _unit), do: :water_temperature
  defp parse_type("stream", _unit), do: :stream
  defp parse_type("water", "‰"), do: :salinity
  defp parse_type("water", "kg/m³"), do: :water_density
  defp parse_type("water", "m³/s"), do: :water_flow
  defp parse_type("water", "ml/l"), do: :concentration
  defp parse_type("pressure", "mbar"), do: :air_pressure
  defp parse_type("pressure", "hPa"), do: :air_pressure
  defp parse_type("air", "%"), do: :humidity
  defp parse_type("airtemp", "°C"), do: :temperature
  defp parse_type("sight", "m"), do: :sight
  defp parse_type("wave", "m"), do: :wave_height
  defp parse_type("wave", "s"), do: :wave_period
  defp parse_type("rain", "mm/h"), do: :rain
  defp parse_type("rain", "#/cm2/h"), do: :hail_intensity
  defp parse_type("dewpointtemp", "°C"), do: :dewpoint_temperature

  defp parse_quality("Ok"), do: :ok
  defp parse_quality("Gammalt värde"), do: :old_value
  defp parse_quality("Kvalitetsfel"), do: :quality_error
  defp parse_quality(quality), do: {:unknown, quality}
end
