defmodule Coinpayments.Mixfile do
  use Mix.Project

  def project do
    [
      app: :coinpayments,
      version: "0.5.2",
      elixir: "~> 1.5",
      build_embedded: Mix.env == :prod,
      start_permanent: Mix.env == :prod,
      description: description(),
      source_url: "https://github.com/shannonwells/coinpayments_ex",
      package: package(),
      deps: deps()
    ]
  end

  def application do
    []
  end

  defp deps do
    [
      {:tesla, "~> 0.10.0"},
      {:ex_doc, ">= 0.0.0", only: :dev},
      {:mock, "~> 0.3.0", only: :test}
    ]
  end

  defp description do
    "A wrapper for the Coinpayments API"
  end

  defp package do
    [
      maintainers: ["Shannon Wells"],
      links: %{"GitHub": "https://github.com/shannonwells/coinpayments_ex"},
      licenses: ["MIT"]
    ]
  end
end
