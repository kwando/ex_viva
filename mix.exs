defmodule Viva.MixProject do
  use Mix.Project

  def project do
    [
      app: :viva,
      version: "0.1.0",
      elixir: "~> 1.8",
      start_permanent: Mix.env() == :prod,
      deps: deps()
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger]
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:jason, ">= 0.0.0"},
      {:hackney, ">= 0.0.0"},
      {:exsync, ">= 0.0.0", only: :dev},
      {:mix_test_watch, "0.9.0", runtime: false, only: :dev}
    ]
  end
end
