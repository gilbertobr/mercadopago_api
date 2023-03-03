defmodule Mercadopago.API do
  require Logger

  @moduledoc """
  Documentation for Mercadopago.API. This module is about the base HTTP functionality
  """
  @base_url "https://api.mercadopago.com"

  @doc """
  Requests an OAuth token from Mercadopago, returns a tuple containing the token and seconds till expiry.

  Possible returns:

  - {:ok, data}
  - {:error, reason}

  ## Examples

      iex> Mercadopago.API.create_token()
      {:ok, {..}}

  """  
  def create_token() do
    params = %{
      "client_id" => Mercadopago.Config.get.client_id,
      "client_secret" => Mercadopago.Config.get.client_secret,
      "grant_type" => "client_credentials"
    }

    headers = [
      {"content-type", "application/x-www-form-urlencoded"}
    ]

    case HTTPoison.post(base_url() <> "/oauth/token", Poison.encode!(params), headers) do
      {:ok, %HTTPoison.Response{status_code: 200, body: body}} ->
        token = body |> Poison.decode!()

        Logger.info("Access token obtained successfully.")
        {:ok, {token["access_token"], token["expires_in"]}}

      {:error, %HTTPoison.Error{reason: reason}} ->
        Logger.error("Error getting access token: #{inspect(reason)}")
        {:error, reason}
    end
  end

  @doc """
  Make a HTTP GET request to the correct API depending on environment, adding needed auth header.

  Possible returns:

  - {:ok, data}
  - {:ok, :not_found}
  - {:ok, :no_content}
  - {:error, :bad_network}
  - {:error, reason}

  ## Examples

      iex> Mercadopago.API.get(url)
      {:ok, {...}}

  """  
  def get(url) do
    case HTTPoison.get(base_url() <> url, headers()) do
      {:ok, %{status_code: 404}} ->
        {:ok, :not_found}
      {:ok, %{status_code: 401}} ->
        {:error, :unauthorised}        
      {:ok, %{status_code: 400}} ->
        {:ok, :not_found}
      {:ok, %{status_code: 204}} ->
        {:ok, :no_content}
      {:ok, %{body: body, status_code: 200}} ->
        {:ok, Poison.decode!(body, keys: :atoms)}        
      {:ok, %{body: body}}->
        {:error, body}
      _ ->
        {:error, :bad_network}
    end
  end

  defp headers() do
    [
      {"Authorization", "Bearer #{mercadopago_token()}"},
      {"Content-Type", "application/json"}
    ]
  end

  defp base_url,
    do: @base_url

  defp mercadopago_token,
    do: Mercadopago.get_token()

end
