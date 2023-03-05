[![Hex pm](https://img.shields.io/hexpm/v/mercadopago_api.svg?style=flat)](https://hex.pm/packages/mercadopago_api)

# Mercadopago

**Elixir library for working with the Mercadopago REST API.**

## Installation

If [available in Hex](https://hex.pm/docs/publish), the package can be installed
by adding `mercadopago_api` to your list of dependencies in `mix.exs`:

```elixir
def deps do
  [
    {:mercadopago_api, "~> 0.2.1"}
  ]
end
```

## config.exs

```elixir
  config :mercadopago_api,
    client_id: "MERCADOPAGO_CLIENT_ID",
    client_secret: "MERCADOPAGO_CLIENT_SECRET"
```

Documentation can be generated with [ExDoc](https://github.com/elixir-lang/ex_doc)
and published on [HexDocs](https://hexdocs.pm). Once published, the docs can
be found at <https://hexdocs.pm/mercadopago_api>.

## License

    Copyright © 2023-present Gilberto Junior <gilberto.ti001@gmail.com>

    This work is free. You can redistribute it and/or modify it under the
    terms of the MIT License. See the LICENSE file for more details.