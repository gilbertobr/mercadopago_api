defmodule Mercadopago.Config do
  
  @moduledoc """
  Documentation for Mercadopago.Config

  Basically this is just for getting configuration values

  ## Examples

      iex(1)> Mercadopago.Config.get
      %{client_id: "MERCADOPAGO_CLIENT_ID", client_secret: "MERCADOPAGO_CLIENT_SECRET"}
  """

  @doc """
  Get the configuration object, this reads both the config file and system environment variables.
  Env vars are first priority, config second.

  Environment vars:
  - MERCADOPAGO_CLIENT_ID
  - MERCADOPAGO_CLIENT_SECRET

  Example config.exs sample:

      config :mercadopago,
        client_id: "MERCADOPAGO_CLIENT_ID",
        client_secret: "MERCADOPAGO_CLIENT_SECRET",

  ## Examples

      iex(1)> Mercadopago.Config.get
      %{client_id: "MERCADOPAGO_CLIENT_ID", client_secret: "MERCADOPAGO_CLIENT_SECRET"}
  """
  @spec get :: %{client_id: String.t, client_secret: String.t}
  def get do
    case !is_nil(System.get_env("MERCADOPAGO_CLIENT_ID")) && !is_nil(System.get_env("MERCADOPAGO_CLIENT_SECRET")) do
      true ->
        %{client_id: System.get_env("MERCADOPAGO_CLIENT_ID"), client_secret: System.get_env("MERCADOPAGO_CLIENT_SECRET")}
      _ ->
        %{client_id: Application.get_env(:mercadopago, :client_id), client_secret: Application.get_env(:mercadopago, :client_secret)}
    end
  end
end
