defmodule Mercadopago do
  @moduledoc """
  Documentation for `Mercadopago`.
  """

  @doc """
  Function that returns the Mercadopago token.

  ## Examples

      iex> Mercadopago.get_token()
      "APP_xxxxxxxxxxxxxxx"

  """  
  def get_token() do
    Agent.get(:token_agent, fn state -> state end)
  end

end
