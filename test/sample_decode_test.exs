defmodule Viva.SampleDecoderTest do
  use ExUnit.Case, async: true

  test "simple_decode full sample" do
    samples = File.read!("test/full_sample.etf") |> :erlang.binary_to_term()

    for %{"GetSingleStationResult" => %{"Samples" => samples}} <- samples do
      for sample <- samples do
        assert %Viva.Sample{} = Viva.Decoders.Sample.simple_decode(sample)

      end
    end
  end
end
