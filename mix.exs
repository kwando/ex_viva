defmodule ExViva.MixProject do
  use Mix.Project

  def project do
    [
      app: :ex_viva,
      version: "0.2.0",
      elixir: "~> 1.8",
      start_permanent: Mix.env() == :prod,
      deps: deps(),
      description: "Weather observations from the Swedish Maritime Administration",
      package: package()
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger]
    ]
  end

  def package() do
    [
      files: ["lib", "mix.exs", "README*", "LICENSE*"],
      maintainers: ["Hannes Nevalainen"],
      licenses: ["MIT"],
      links: %{"GitHub" => "https://github.com/kwando/ex_viva"}
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:jason, ">= 0.0.0"},
      {:exsync, ">= 0.0.0", only: :dev},
      {:ex_doc, ">= 0.0.0", only: :dev},
      {:mix_test_watch, "0.9.0", runtime: false, only: :dev},
      {:req, "~> 0.3"}
    ]
  end
end
