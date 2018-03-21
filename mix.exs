defmodule Coinpayments.Mixfile do
  use Mix.Project

  def project do
    [
      app: :coinpayments,
      version: "0.5.1",
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
      {:mock, "~> 0.3.0", only: :test}
    ]
  end

  defp description do
    ""
  end

  defp package do
    [
      maintainers: "Shannon Wells",
      links: %{"GitHub": "https://github.com/shannonwells/coinpayments_ex"},
      licenses: ["MIT"]
    ]
  end
end
