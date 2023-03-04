defmodule Mercadopago.Requests.Identification do
    @moduledoc """
    Documentation for Mercadopago.Requests.Identification
    """

    @doc """
    Get document types
    [docs](https://www.mercadopago.com.br/developers/pt/reference/identification_types/_identification_types/get)    

    ## Examples

        iex> Mercadopago.Requests.Identification.search()
        {:ok,[
          %{id: "CPF", max_length: 11, min_length: 11, name: "CPF", type: "number"},
          %{id: "CNPJ", max_length: 14, min_length: 14, name: "CNPJ", type: "number"}
        ]}    
    """
    def search() do
        Mercadopago.API.get("/v1/identification_types")
    end

end