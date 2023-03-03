defmodule Mercadopago.MixProject do
  use Mix.Project

  def project do
    [
      app: :mercadopago_api,
      version: "0.1.0",
      elixir: "~> 1.14",
      start_permanent: Mix.env() == :prod,
      description: description(),
      package: package(),   
      name: "MercadopagoAPI",
      deps: deps()
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger],
      mod: {Mercadopago.Application, []}
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:httpoison, "2.0.0"},
      {:poison, "5.0.0"},
      {:ex_doc, "~> 0.14", only: :dev, runtime: false}
    ]
  end

  defp description() do
    "Elixir library for communicating with the Mercado Pago payments API."
  end  

  defp package() do
    [
      name: "mercadopago_api",
      files: ~w(lib .formatter.exs mix.exs README.md LICENSE*
                CHANGELOG*),
      licenses: ["Apache-2.0"],
      links: %{"GitHub" => "https://github.com/gilbertobr/mercadopago_api"}
    ]
  end  
end
