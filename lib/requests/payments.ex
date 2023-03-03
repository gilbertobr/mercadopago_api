defmodule Mercadopago.Requests.Payments do
    @moduledoc """
    Documentation for Mercadopago.Requests.Payments
    """

    @doc """
    Search in payments
    [docs](https://www.mercadopago.com.br/developers/pt/reference/payments/_payments_search/get)    

    ## Examples

        iex> Mercadopago.Requests.Payments.search()
        {:ok, %{
        date_created: "2023-02-10T19:45:48.000-04:00",
        sponsor_id: nil,
        money_release_status: "released",
        status: "approved",
        date_last_updated: "2023-02-10T19:47:23.000-04:00",
        merchant_number: nil,
        acquirer_reconciliation: [],
        brand_id: nil,
        captured: true,
        order: %{},
        authorization_code: nil,
        date_of_expiration: nil,
        ...
        }}    
    """
    def search() do
        Mercadopago.API.get("/v1/payments/search")
    end

end