defmodule LndClient.MixProject do
  use Mix.Project

  @version "0.1.7"

  def project do
    [
      app: :lnd_client,
      version: @version,
      description: "Connect to an LND instance, issue commands and subscribe to live information",
      elixir: "~> 1.14",
      start_permanent: Mix.env() == :prod,
      deps: deps(),
      docs: docs(),
      package: package()
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger]
    ]
  end

  defp docs do
    [
      # The main page in the docs
      main: "LndClient",
      source_ref: @version,
      source_url: "https://github.com/roosoft/lnd_client"
    ]
  end

  def package do
    [
      maintainers: ["Marc Lacoursière"],
      licenses: ["UNLICENCE"],
      links: %{"GitHub" => "https://github.com/roosoft/lnd_client"}
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:ex_doc, "~> 0.28", only: :dev, runtime: false},
      {:grpc, "~> 0.5.0"},
      {:protobuf, "~> 0.11.0"}
    ]
  end
end
