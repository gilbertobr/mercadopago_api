defmodule Mercadopago.Application do
  # See http://elixir-lang.org/docs/stable/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false
  require Logger
  use Application

  def start(_type, _args) do
    import Supervisor.Spec, warn: false

    Agent.start_link(fn -> nil end, name: :token_agent)

    children = if Application.get_env(:mercadopago, :environment) == :test, do: [], else: [worker(Task, [&refresh_token/0], [restart: :permanent])]

    opts = [strategy: :one_for_one, name: Mercadopago.Supervisor]
    Supervisor.start_link(children, opts)
  end

  defp refresh_token(_seconds \\ 1000) do
    case Mercadopago.API.create_token() do
      {:ok, {token, seconds}} ->
        Logger.info "[Mercadopago] Refreshed access token, expires in #{seconds} seconds"
        Agent.update(:token_agent, fn _state -> token end)
        :timer.sleep(seconds * 1000)
        refresh_token(seconds)
      {:error, reason} ->
        Logger.error "[Mercadopago] Refreshing access token failed with reason: #{reason}, retrying in 1 second"
        :timer.sleep(1000)
        refresh_token()
    end
  end

end
